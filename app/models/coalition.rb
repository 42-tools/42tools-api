class Coalition < ApplicationRecord
  belongs_to :master, class_name: :User, optional: true

  has_many :coalitions_users, dependent: :destroy
  has_many :users, through: :coalitions_users
end
