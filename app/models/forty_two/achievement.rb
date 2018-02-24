class FortyTwo::Achievement < ApplicationRecord
  belongs_to :parent, class_name: 'FortyTwo::Achievement',  optional: true
  belongs_to :title,  class_name: 'FortyTwo::Title',        optional: true
end
