class FortyTwo::ProjectsUser < ApplicationRecord
  belongs_to :project,  class_name: 'FortyTwo::Project'
  belongs_to :user,     class_name: 'FortyTwo::User'

  has_many :cursus_projects_users,  class_name: 'FortyTwo::CursusProjectsUsers',  dependent: :destroy
  has_many :cursus,                 class_name: 'FortyTwo::Cursus',               through: :cursus_projects_users
end
