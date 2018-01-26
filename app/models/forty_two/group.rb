class FortyTwo::Group < ApplicationRecord
  has_many :groups_users, class_name: 'FortyTwo::GroupsUser', dependent: :destroy
  has_many :groups,       class_name: 'FortyTwo::Group',      through: :groups_users
end
