class FortyTwo::Coalition < ApplicationRecord
  belongs_to :master, class_name: 'FortyTwo::User', optional: true

  has_many :coalitions_users, class_name: 'FortyTwo::CoalitionsUser', dependent: :destroy
  has_many :users,            class_name: 'FortyTwo::User',           through: :coalitions_users
end
