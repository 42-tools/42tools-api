class Campus < ApplicationRecord
  has_many :campus_users
  has_many :users, through: :campus_users
end
