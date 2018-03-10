class FortyTwo::Group < ApplicationRecord
  include FortytwoConcern

  has_many :groups_users, class_name: 'FortyTwo::GroupsUser', dependent: :destroy

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id, name: data.name
      }
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/groups/#{id}" }
  end
end
