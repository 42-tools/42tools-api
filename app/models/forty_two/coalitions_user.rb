class FortyTwo::CoalitionsUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :coalition,  class_name: 'FortyTwo::Coalition'
  belongs_to :user,       class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :coalition
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id: data.user_id, coalition_id: data.coalition_id
      }.merge(
        coalition_attributes: { id: data.coalition_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/coalitions_users/#{id}" }
  end
end
