class FriendsGroup < ApplicationRecord
  belongs_to :owner, class_name: :User

  has_many :friends_groups_users, dependent: :destroy
  has_many :friends_users, through: :friends_groups_users
  has_many :friends, through: :friends_users
end
