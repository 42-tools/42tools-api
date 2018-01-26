class FortyTwo::CoalitionsUser < ApplicationRecord
  belongs_to :coalition,  class_name: 'FortyTwo::Coalition'
  belongs_to :user,       class_name: 'FortyTwo::User'
end
