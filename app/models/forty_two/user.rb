class FortyTwo::User < ApplicationRecord
  has_many :tokens,           class_name: 'Token',                    dependent: :destroy
  has_many :groups_users,     class_name: 'FortyTwo::GroupsUser',     dependent: :destroy
  has_many :coalitions_users, class_name: 'FortyTwo::CoalitionsUser', dependent: :destroy
  has_many :campus_users,     class_name: 'FortyTwo::CampusUser',     dependent: :destroy
  has_many :cursus_users,     class_name: 'FortyTwo::CursusUser',     dependent: :destroy
  has_many :projects_users,   class_name: 'FortyTwo::ProjectsUser',   dependent: :destroy
  has_many :friends_users,    class_name: 'FriendsUser',              foreign_key: :owner_id, dependent: :destroy
  has_many :friends_groups,   class_name: 'FriendsGroup',             foreign_key: :owner_id, dependent: :destroy

  has_many :apps,     class_name: 'FortyTwo::App',      through: :tokens
  has_many :groups,   class_name: 'FortyTwo::Group',    through: :groups_users
  has_many :campus,   class_name: 'FortyTwo::Campus',   through: :campus_users
  has_many :cursus,   class_name: 'FortyTwo::Cursus',   through: :cursus_users
  has_many :projects, class_name: 'FortyTwo::Project',  through: :projects_users
  has_many :friends,  class_name: 'FriendsUser',        through: :friends_users
  has_many :logs,     class_name: 'Log',                through: :tokens

  rails_admin do
    object_label_method :login
  end
end
