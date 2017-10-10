class ProjectsUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :projects_users_cursus, class_name: :ProjectsUsersCursus
  has_many :cursus, through: :projects_users_cursus
end
