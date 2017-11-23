class Group < ApplicationRecord
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users
end
