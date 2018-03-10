class FortyTwo::GroupsUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :group,  class_name: 'FortyTwo::Group'
  belongs_to :user,   class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :group
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id: data.user_id, group_id: data.group_id
      }.merge(
        group_attributes: { id: data.group_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/groups_users/#{id}" }
  end
end
