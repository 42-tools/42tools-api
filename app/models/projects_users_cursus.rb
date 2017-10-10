class ProjectsUsersCursus < ApplicationRecord
  belongs_to :projects_user
  belongs_to :cursus
end
