class FortyTwo::CursusProjectsUsers < ApplicationRecord
  belongs_to :projects_user,  class_name: 'FortyTwo::ProjectsUser'
  belongs_to :cursus,         class_name: 'FortyTwo::Cursus'
end
