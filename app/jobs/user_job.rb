class UserJob < ApplicationJob
  queue_as :user

  def perform(user_id = nil, user_payload = nil)
    if user_payload
      user_data = JSON.parse(user_payload, object_class: Intra42::DataStruct)
    else
      user_payload = Intra42.instance.get("/v2/users/#{user_id}")

      return unless user_payload.success?

      user_data = user_payload.body
    end

    # User

    user = User.find_or_create_by!(id: user_id)
    user.update(
      login:      user_data.login,      email:     user_data.email,
      first_name: user_data.first_name, last_name: user_data.last_name,
      phone:      user_data.phone,      image_url: user_data.image_url,
      pool_month: user_data.pool_month, pool_year: user_data.pool_year,
      wallet:     user_data.wallet,     staff:     user_data.staff?,
      correction_point: user_data.correction_point
    )

    # Groups

    groups_users_payload = Intra42.instance.get("/v2/users/#{user_id}/groups_users")

    if groups_users_payload.success?
      groups_users_data = groups_users_payload.body

      groups_users_data.each do |data|
        group = Group.find_or_create_by!(id: data.group_id)

        groups_user = user.groups_users.find_or_initialize_by(id: data.id)
        groups_user.group = group
        groups_user.save!
      end

      user.groups_users.where(id: user.groups_user_ids - groups_users_data.map(&:id)).destroy_all
    end

    # Cursus

    user_data.cursus_users.each do |data|
      cursus = Cursus.find_or_create_by!(id: data.cursus.id)
      cursus.update(name: data.cursus.name, slug: data.cursus.slug)

      cursus_user = user.cursus_users.find_or_initialize_by(id: data.id)
      cursus_user.cursus = cursus
      cursus_user.save!
    end

    user.cursus_users.where(id: user.cursus_user_ids - user_data.cursus_users.map(&:id)).destroy_all

    # Campus

    user_data.campus.each do |data|
      campus = Campus.find_or_create_by!(id: data.id)
      campus.update(name: data.name)
    end

    user_data.campus_users.each do |data|
      campus = Campus.find_or_create_by!(id: data.campus_id)

      campus_user = user.campus_users.find_or_initialize_by(id: data.id)
      campus_user.campus = campus
      campus_user.save!

      campus_user.update(primary: data.is_primary)
    end

    user.campus_users.where(id: user.campus_user_ids - user_data.campus_users.map(&:id)).destroy_all

    # Projects

    user_data.projects_users.each do |data|
      project = Project.find_or_create_by!(id: data.project.id)
      project.update(name: data.project.name, slug: data.project.slug)

      projects_user = user.projects_users.find_or_initialize_by(id: data.id)
      projects_user.project = project
      projects_user.save!

      projects_user.update(occurrence: data.occurrence, final_mark: data.final_mark, status: data.status, validated: data.validated?)

      data.cursus_ids.map do |id|
        cursus = Cursus.find_or_create_by!(id: id)

        projects_user.projects_users_cursus.find_or_create_by!(cursus: cursus)
      end

      projects_user.projects_users_cursus.where(cursus_id: projects_user.projects_users_cursu_ids - data.cursus_ids).destroy_all
    end

    user
  end
end
