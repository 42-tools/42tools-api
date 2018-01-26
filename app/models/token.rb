class Token < ApplicationRecord
  belongs_to :app,  class_name: 'FortyTwo::App'
  belongs_to :user, class_name: 'FortyTwo::User', optional: true

  has_many :logs, as: :linkable, dependent: :destroy
end
