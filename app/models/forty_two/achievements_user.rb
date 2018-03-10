class FortyTwo::AchievementsUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :achievement,  class_name: 'FortyTwo::Achievement'
  belongs_to :user,         class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :achievement
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id: data.user_id, achievement_id: data.achievement_id
      }.merge(
        achievement_attributes: { id: data.achievement_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/achievements_users/#{id}" }
  end
end
