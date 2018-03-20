class FortyTwo::LanguagesUser < ApplicationRecord
  belongs_to :language, class_name: 'FortyTwo::Language'
  belongs_to :user,     class_name: 'FortyTwo::User'
end
