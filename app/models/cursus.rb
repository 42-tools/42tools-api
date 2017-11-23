class Cursus < ApplicationRecord
  has_many :cursus_users, dependent: :destroy
  has_many :projects_users_cursus, class_name: :ProjectsUsersCursus, dependent: :destroy
  has_many :users, through: :cursus_users
end
