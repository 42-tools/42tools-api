class FortyTwo::User < ApplicationRecord
  include FortytwoConcern

  has_many :tokens,             class_name: 'Token',                      dependent: :destroy
  has_many :achievements_users, class_name: 'FortyTwo::AchievementsUser', dependent: :destroy
  has_many :titles_users,       class_name: 'FortyTwo::TitlesUser',       dependent: :destroy
  has_many :groups_users,       class_name: 'FortyTwo::GroupsUser',       dependent: :destroy
  has_many :coalitions_users,   class_name: 'FortyTwo::CoalitionsUser',   dependent: :destroy
  has_many :coalitions_masters, class_name: 'FortyTwo::Coalition',        foreign_key: :master_id
  has_many :campus_users,       class_name: 'FortyTwo::CampusUser',       dependent: :destroy
  has_many :cursus_users,       class_name: 'FortyTwo::CursusUser',       dependent: :destroy
  has_many :projects_users,     class_name: 'FortyTwo::ProjectsUser',     dependent: :destroy
  has_many :languages_users,    class_name: 'FortyTwo::LanguagesUser',    dependent: :destroy
  has_many :apps_owners,        class_name: 'FortyTwo::App',              foreign_key: :owner_id
  has_many :friends_users,      class_name: 'FriendsUser',                foreign_key: :owner_id, dependent: :destroy
  has_many :friends_groups,     class_name: 'FriendsGroup',               foreign_key: :owner_id, dependent: :destroy

  accepts_nested_attributes_for :titles_users
  accepts_nested_attributes_for :campus_users
  accepts_nested_attributes_for :cursus_users
  accepts_nested_attributes_for :projects_users
  accepts_nested_attributes_for :languages_users

  has_many :apps,         class_name: 'FortyTwo::App',          through: :tokens
  has_many :achievements, class_name: 'FortyTwo::Achievement',  through: :achievements_users
  has_many :titles,       class_name: 'FortyTwo::Title',        through: :titles_users
  has_many :groups,       class_name: 'FortyTwo::Group',        through: :groups_users
  has_many :campus,       class_name: 'FortyTwo::Campus',       through: :campus_users
  has_many :cursus,       class_name: 'FortyTwo::Cursus',       through: :cursus_users
  has_many :projects,     class_name: 'FortyTwo::Project',      through: :projects_users
  has_many :coalitions,   class_name: 'FortyTwo::Coalition',    through: :coalitions_users
  has_many :languages,    class_name: 'FortyTwo::Languages',    through: :languages_users
  has_many :friends,      class_name: 'FortyTwo::User',         through: :friends_users
  has_many :logs,         class_name: 'Log',                    through: :tokens

  accepts_nested_attributes_for :achievements
  accepts_nested_attributes_for :titles
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :campus

  before_destroy do |record|
    record.coalitions_masters.update_all(master_id: nil)
    record.apps_owners.update_all(master_id: nil)
  end

  rails_admin do
    object_label_method :login
  end

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id:         data.id,
        login:      data.login,      email:     data.email,
        first_name: data.first_name, last_name: data.last_name,
        phone:      data.phone,      image_url: data.image_url,
        pool_month: data.pool_month, pool_year: data.pool_year,
        wallet:     data.wallet,     staff:     data.staff?,
        correction_point: data.correction_point
      }.merge(
        groups_attributes: FortyTwo::Group.process_payload_for_fortytwo(data.groups),
        titles_attributes: FortyTwo::Title.process_payload_for_fortytwo(data.titles),
        titles_users_attributes: FortyTwo::TitlesUser.process_payload_for_fortytwo(data.titles_users),
        achievements_attributes: FortyTwo::Achievement.process_payload_for_fortytwo(data.achievements),
        projects_users_attributes: FortyTwo::Achievement.process_payload_for_fortytwo(data.projects_users),
        languages_users_attributes: FortyTwo::LanguagesUser.process_payload_for_fortytwo(data.languages_users),
        campus_attributes: FortyTwo::Campus.process_payload_for_fortytwo(data.campus),
        campus_users_attributes: FortyTwo::CampusUser.process_payload_for_fortytwo(data.campus_users),
        cursus_users_attributes: FortyTwo::CursusUser.process_payload_for_fortytwo(data.cursus_users),
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/users/#{id}" }
  end
end
