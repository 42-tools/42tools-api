class FortyTwo::Campus < ApplicationRecord
  has_many :campus_users, class_name: 'FortyTwo::CampusUser', dependent: :destroy
  has_many :users,        class_name: 'FortyTwo::User',       through: :campus_users
end
