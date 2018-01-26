class FortyTwo::Project < ApplicationRecord
  has_many :projects_users, class_name: 'FortyTwo::ProjectsUser', dependent: :destroy
end
