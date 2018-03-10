class FortyTwo::CampusUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :campus, class_name: 'FortyTwo::Campus'
  belongs_to :user,   class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :campus
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id:    data.user_id, campus_id: data.campus_id,
        is_primary: data.is_primary
      }.merge(
        campus_attributes: { id: data.campus_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/campus_users/#{id}" }
  end
end
