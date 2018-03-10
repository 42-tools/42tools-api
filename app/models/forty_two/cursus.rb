class FortyTwo::Cursus < ApplicationRecord
  has_many :cursus_users,           class_name: 'FortyTwo::CursusUser',           dependent: :destroy
  has_many :cursus_projects_users,  class_name: 'FortyTwo::CursusProjectsUsers',  dependent: :destroy
  has_many :users,                  class_name: 'FortyTwo::User',                 through: :cursus_users
end
