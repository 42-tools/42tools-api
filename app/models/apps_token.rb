class AppsToken < ApplicationRecord
  belongs_to :app
  belongs_to :user, optional: true

  has_many :logs, as: :linkable, dependent: :destroy
end
