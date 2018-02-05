class FortyTwo::TitlesUser < ApplicationRecord
  belongs_to :title,  class_name: 'FortyTwo::Title'
  belongs_to :user,   class_name: 'FortyTwo::User'
end
