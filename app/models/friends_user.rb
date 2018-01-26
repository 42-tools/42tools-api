class FriendsUser < ApplicationRecord
  belongs_to :owner,  class_name: 'FortyTwo::User'
  belongs_to :friend, class_name: 'FortyTwo::User'

  has_many :friends_groups_users, dependent: :destroy
  has_many :friends_groups, through: :friends_groups_users
end
