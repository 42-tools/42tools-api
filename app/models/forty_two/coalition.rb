class FortyTwo::Coalition < ApplicationRecord
  include FortytwoConcern

  belongs_to :master, class_name: 'FortyTwo::User', optional: true

  has_many :coalitions_users, class_name: 'FortyTwo::CoalitionsUser', dependent: :destroy

  accepts_nested_attributes_for :master

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, slug: data.slug, image_url: data.image_url,
        color: data.color, score: data.score
      }.merge(
        master_attributes: { id: data.user_id },
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/coalitions/#{id}" }
  end
end
