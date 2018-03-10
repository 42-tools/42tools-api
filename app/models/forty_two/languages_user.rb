class FortyTwo::LanguagesUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :language, class_name: 'FortyTwo::Language'
  belongs_to :user,     class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :language
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        language_id: data.language_id, user_id: data.user_id,
        position: data.position
      }.merge(
        language_attributes: { id: data.language_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/languages_users/#{id}" }
  end
end
