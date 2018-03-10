class FortyTwo::Campus < ApplicationRecord
  belongs_to :language, class_name: 'FortyTwo::Language', optional: true

  has_many :campus_users, class_name: 'FortyTwo::CampusUser', dependent: :destroy
  has_many :users,        class_name: 'FortyTwo::User',       through: :campus_users
end
