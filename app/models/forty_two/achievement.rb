class FortyTwo::Achievement < ApplicationRecord
  include FortytwoConcern

  belongs_to :parent, class_name: 'FortyTwo::Achievement',  optional: true
  belongs_to :title,  class_name: 'FortyTwo::Title',        optional: true

  has_many :achievements_users, class_name: 'FortyTwo::AchievementsUser', dependent: :destroy

  accepts_nested_attributes_for :parent
  accepts_nested_attributes_for :title

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        name: data.name, description: data.description,
        tier: data.tier, kind: data.kind,
        visible: data.visible, image: data.image,
        nbr_of_success: data.nbr_of_success,
        parent_id: data.parent&.id, title_id: data.title&.id
      }.merge(
        parent_attributes: data.parent && FortyTwo::Achievement.process_payload_for_fortytwo(data.parent),
        title_attributes: data.title && { id: data.title.id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/achievements/#{id}" }
  end
end
