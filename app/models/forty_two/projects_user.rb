class FortyTwo::ProjectsUser < ApplicationRecord
  belongs_to :project,  class_name: 'FortyTwo::Project'
  belongs_to :user,     class_name: 'FortyTwo::User'

  has_many :projects_users_cursus,  class_name: 'FortyTwo::ProjectsUsersCursus',  dependent: :destroy
  has_many :cursus,                 class_name: 'FortyTwo::Cursus',               through: :projects_users_cursus
end
