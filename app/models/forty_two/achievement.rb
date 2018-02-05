class FortyTwo::Achievement < ApplicationRecord
  belongs_to :parent, class_name: 'FortyTwo::Achievement'
end
