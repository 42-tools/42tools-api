class Coalition < ApplicationRecord
  belongs_to :master, class_name: :User, optional: true
end
