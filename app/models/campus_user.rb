class CampusUser < ApplicationRecord
  belongs_to :campus
  belongs_to :user
end
