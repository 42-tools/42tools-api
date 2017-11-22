class CoalitionsUser < ApplicationRecord
  belongs_to :coalition
  belongs_to :user
end
