class Cursus < ApplicationRecord
  has_many :cursus_users
  has_many :users, through: :cursus_users
end
