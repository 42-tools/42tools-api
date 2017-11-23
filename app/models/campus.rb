class Campus < ApplicationRecord
  has_many :campus_users, dependent: :destroy
  has_many :users, through: :campus_users
end
