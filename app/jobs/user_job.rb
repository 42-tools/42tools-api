class UserJob < ApplicationJob
  queue_as :user

  def perform(user_id = nil, user_payload = nil)
    user_data = if user_payload
                  JSON.parse(user_payload, object_class: FortyTwo::Api::DataStruct)
                else
                  user_payload = FortyTwo::Api.instance.get("/v2/users/#{user_id}")

                  return unless user_payload.success?

                  user_payload.body
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

    # Titles

    user_data.titles.each do |data|
      campus = FortyTwo::Title.find_or_initialize_by(id: data.id)
      campus.assign_attributes(name: data.name)
      campus.save!
    end

    user_data.titles_users.each do |data|
      title = FortyTwo::Title.find_or_create_by!(id: data.title_id)

      titles_user = user.titles_users.find_or_initialize_by(id: data.id)
      titles_user.assign_attributes(title: title, selected: data.selected)
      titles_user.save!
    end

    user.titles_users.where(id: user.titles_user_ids - user_data.titles_users.map(&:id)).destroy_all

    # Groups

    user_data.groups.each do |data|
      campus = FortyTwo::Group.find_or_initialize_by(id: data.id)
      campus.assign_attributes(name: data.name)
      campus.save!
    end

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
    # TODO: skills

    user_data.cursus_users.each do |data|
      cursus = FortyTwo::Cursus.find_or_initialize_by(id: data.cursus.id)
      cursus.assign_attributes(name: data.cursus.name, slug: data.cursus.slug)
      cursus.save!

      cursus_user = user.cursus_users.find_or_initialize_by(id: data.id)
      cursus_user.assign_attributes(cursus: cursus, grade: data.grade, level: data.level,
                                    begin_at: data.begin_at, end_at: data.end_at, has_coalition: data.has_coalition)
      cursus_user.save!
    end

    user.cursus_users.where(id: user.cursus_user_ids - user_data.cursus_users.map(&:id)).destroy_all

    # Campus

    user_data.campus.each do |data|
      campus = FortyTwo::Campus.find_or_initialize_by(id: data.id)
      campus.assign_attributes(name: data.name)
      campus.save!
    end

    user_data.campus_users.each do |data|
      campus = FortyTwo::Campus.find_or_create_by!(id: data.campus_id)

      campus_user = user.campus_users.find_or_initialize_by(id: data.id)
      campus_user.assign_attributes(campus: campus, primary: data.is_primary)
      campus_user.save!
    end

    user.campus_users.where(id: user.campus_user_ids - user_data.campus_users.map(&:id)).destroy_all

    # Achievements
    # TODO: titles, parent

    user_data.achievements.each do |data|
      achievement = FortyTwo::Achievement.find_or_initialize_by(id: data.achievement_id)
      achievement.assign_attributes(name: data.name, description: data.description, tier: data.tier,
                                    kind: data.kind, visible: data.visible, image: data.image,
                                    nbr_of_success: data.nbr_of_success)
      achievement.save!
    end

    # achievements_users_payload = FortyTwo::Api.instance.get('/v2/achievements_users', filter: { user_id: user_id })
    #
    # if achievements_users_payload.success?
    #   achievements_users_data = achievements_users_payload.body
    #
    #   achievements_users_data.each do |data|
    #     achievement = FortyTwo::Achievement.find_or_create_by!(id: data.achievement_id)
    #
    #     achievements_user = user.achievements_users.find_or_initialize_by(id: data.id)
    #     achievements_user.assign_attributes(achievement: achievement)
    #     achievements_user.save!
    #   end
    #
    #   user.achievements_users.where(id: user.achievements_user_ids - achievements_users_data.map(&:id)).destroy_all
    # end

    # Projects

    user_data.projects_users.each do |data|
      project_parent = FortyTwo::Project.find_or_create_by!(id: data.project.parent_id)
      project = FortyTwo::Project.find_or_create_by!(id: data.project.id)
      project.assign_attributes(parent: project_parent, name: data.project.name, slug: data.project.slug)
      project.save!

      projects_user = user.projects_users.find_or_initialize_by(id: data.id)
      projects_user.assign_attributes(project: project, occurrence: data.occurrence, final_mark: data.final_mark,
                                      status: data.status, validated: data.validated?)
      projects_user.save!

      data.cursus_ids.map do |id|
        cursus = FortyTwo::Cursus.find_or_create_by!(id: id)

        projects_user.cursus_projects_users.find_or_create_by!(cursus: cursus)
      end

      projects_user.cursus_projects_users.where(cursus_id: projects_user.cursus_projects_users_ids - data.cursus_ids).destroy_all
    end

    user.projects_users.where(id: user.projects_user_ids - user_data.projects_users.map(&:id)).destroy_all

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
