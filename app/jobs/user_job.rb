class UserJob < ApplicationJob
  queue_as :user

  def perform(user_id = nil, user_payload = nil)
    if user_payload
      user_data = JSON.parse(user_payload, object_class: FortyTwo::Api::DataStruct)
    else
      user_payload = FortyTwo::Api.instance.get("/v2/users/#{user_id}")

      return unless user_payload.success?

      user_data = user_payload.body
    end

    # User

    user = FortyTwo::User.find_or_initialize_by(id: user_id)
    user.assign_attributes(
      login:      user_data.login,      email:     user_data.email,
      first_name: user_data.first_name, last_name: user_data.last_name,
      phone:      user_data.phone,      image_url: user_data.image_url,
      pool_month: user_data.pool_month, pool_year: user_data.pool_year,
      wallet:     user_data.wallet,     staff:     user_data.staff?,
      correction_point: user_data.correction_point
    )
    user.save!

    # Groups

    groups_users_payload = FortyTwo::Api.instance.get("/v2/users/#{user_id}/groups_users")

    if groups_users_payload.success?
      groups_users_data = groups_users_payload.body

      groups_users_data.each do |data|
        group = FortyTwo::Group.find_or_create_by!(id: data.group_id)

        groups_user = user.groups_users.find_or_initialize_by(id: data.id)
        groups_user.assign_attributes(group: group)
        groups_user.save!
      end

      user.groups_users.where(id: user.groups_user_ids - groups_users_data.map(&:id)).destroy_all
    end

    # Cursus

    user_data.cursus_users.each do |data|
      cursus = FortyTwo::Cursus.find_or_create_by!(id: data.cursus.id)
      cursus.update(name: data.cursus.name, slug: data.cursus.slug)

      cursus_user = user.cursus_users.find_or_initialize_by(id: data.id)
      cursus_user.assign_attributes(cursus: cursus)
      cursus_user.save!
    end

    user.cursus_users.where(id: user.cursus_user_ids - user_data.cursus_users.map(&:id)).destroy_all

    # Campus

    user_data.campus.each do |data|
      campus = FortyTwo::Campus.find_or_create_by!(id: data.id)
      campus.update(name: data.name)
    end

    user_data.campus_users.each do |data|
      campus = FortyTwo::Campus.find_or_create_by!(id: data.campus_id)

      campus_user = user.campus_users.find_or_initialize_by(id: data.id)
      campus_user.assign_attributes(campus: campus)
      campus_user.save!

      campus_user.update(primary: data.is_primary)
    end

    user.campus_users.where(id: user.campus_user_ids - user_data.campus_users.map(&:id)).destroy_all

    # Projects

    user_data.projects_users.each do |data|
      project = FortyTwo::Project.find_or_create_by!(id: data.project.id)
      project.update(name: data.project.name, slug: data.project.slug)

      projects_user = user.projects_users.find_or_initialize_by(id: data.id)
      projects_user.assign_attributes(project: project)
      projects_user.save!

      projects_user.update(occurrence: data.occurrence, final_mark: data.final_mark, status: data.status, validated: data.validated?)

      data.cursus_ids.map do |id|
        cursus = FortyTwo::Cursus.find_or_create_by!(id: id)

        projects_user.projects_users_cursus.find_or_create_by!(cursus: cursus)
      end

      projects_user.projects_users_cursus.where(cursus_id: projects_user.projects_users_cursu_ids - data.cursus_ids).destroy_all
    end

    # Coalitions

    coalitions_users_payload = FortyTwo::Api.instance.get("/v2/users/#{user_id}/coalitions_users")

    if coalitions_users_payload.success?
      coalitions_users_data = coalitions_users_payload.body

      coalitions_users_data.each do |data|
        coalition = FortyTwo::Coalition.find_or_create_by!(id: data.coalition_id)

        coalitions_user = user.coalitions_users.find_or_initialize_by(id: data.id)
        coalitions_user.assign_attributes(coalition: coalition)
        coalitions_user.save!
      end

      user.coalitions_users.where(id: user.coalitions_user_ids - coalitions_users_data.map(&:id)).destroy_all
    end

    user
  end
end
