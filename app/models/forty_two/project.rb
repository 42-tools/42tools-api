class FortyTwo::Project < ApplicationRecord
  belongs_to :parent, class_name: 'FortyTwo::Project'

  has_many :projects_users, class_name: 'FortyTwo::ProjectsUser', dependent: :destroy
end
