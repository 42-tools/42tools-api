class FortyTwo::AchievementsUser < ApplicationRecord
  belongs_to :achievement,  class_name: 'FortyTwo::Achievement'
  belongs_to :user,         class_name: 'FortyTwo::User'
end
