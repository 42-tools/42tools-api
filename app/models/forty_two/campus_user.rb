class FortyTwo::CampusUser < ApplicationRecord
  belongs_to :campus, class_name: 'FortyTwo::Campus'
  belongs_to :user,   class_name: 'FortyTwo::User'
end
