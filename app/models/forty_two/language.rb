class FortyTwo::Language < ApplicationRecord
  has_many :languages_users, class_name: 'FortyTwo::LanguagesUser', dependent: :destroy
end
