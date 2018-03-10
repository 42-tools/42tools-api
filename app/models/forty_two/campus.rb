class FortyTwo::Campus < ApplicationRecord
  include FortytwoConcern

  belongs_to :language, class_name: 'FortyTwo::Language', optional: true

  has_many :campus_users, class_name: 'FortyTwo::CampusUser', dependent: :destroy

  accepts_nested_attributes_for :language

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, time_zone: data.time_zone,
        language_id: data.language.id
      }.merge(
        language_attributes: FortyTwo::Language.process_payload_for_fortytwo(data.language),
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/campus/#{id}" }
  end
end
