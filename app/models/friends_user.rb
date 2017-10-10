class FriendsUser < ApplicationRecord
  belongs_to :owner, class_name: :User
  belongs_to :friend, class_name: :User

  has_many :friends_groups_users, dependent: :destroy
  has_many :friends_groups, through: :friends_groups_users
end
