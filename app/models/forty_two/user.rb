class FortyTwo::User < ApplicationRecord
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
  has_many :friends_users,      class_name: 'FriendsUser',                foreign_key: :owner_id, dependent: :destroy
  has_many :friends_groups,     class_name: 'FriendsGroup',               foreign_key: :owner_id, dependent: :destroy

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

  before_destroy do
    coalitions_masters.update_all(master_id: nil)
  end

  rails_admin do
    object_label_method :login
  end
end
