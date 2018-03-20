class FortyTwo::Title < ApplicationRecord
  has_many :achievements, class_name: 'FortyTwo::Achievement'

  before_destroy do |record|
    record.achievements.update_all(title_id: nil)
  end
end
