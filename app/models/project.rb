class Project < ApplicationRecord
  has_many :projects_users, dependent: :destroy
end
