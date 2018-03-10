class FortyTwo::Role < ApplicationRecord
  include FortytwoConcern

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, description: data.description
      }
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/roles/#{id}" }
  end
end
