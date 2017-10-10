class CursusUser < ApplicationRecord
  belongs_to :cursus
  belongs_to :user
end
