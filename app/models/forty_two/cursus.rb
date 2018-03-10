class FortyTwo::Cursus < ApplicationRecord
  include FortytwoConcern

  has_many :cursus_users, class_name: 'FortyTwo::CursusUser', dependent: :destroy

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, slug: data.slug
      }
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/cursus/#{id}" }
  end
end
