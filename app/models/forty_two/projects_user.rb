class FortyTwo::ProjectsUser < ApplicationRecord
  belongs_to :project,  class_name: 'FortyTwo::Project'
  belongs_to :user,     class_name: 'FortyTwo::User'

  has_and_belongs_to_many :cursus, class_name: 'FortyTwo::Cursus', dependent: :destroy
end
