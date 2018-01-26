class FortyTwo::CursusUser < ApplicationRecord
  belongs_to :cursus, class_name: 'FortyTwo::Cursus'
  belongs_to :user,   class_name: 'FortyTwo::User'
end
