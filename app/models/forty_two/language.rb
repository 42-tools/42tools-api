class FortyTwo::Language < ApplicationRecord
  include FortytwoConcern

  has_many :languages_users, class_name: 'FortyTwo::LanguagesUser', dependent: :destroy

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, identifier: data.identifier
      }
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/languages/#{id}" }
  end
end
