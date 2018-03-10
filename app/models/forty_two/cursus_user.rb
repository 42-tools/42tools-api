class FortyTwo::CursusUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :cursus, class_name: 'FortyTwo::Cursus'
  belongs_to :user,   class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :cursus
  accepts_nested_attributes_for :user

  # TODO: skills
  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id:       data.user.id,  cursus_id: data.cursus_id,
        grade:         data.grade,    level: data.level,
        begin_at:      data.begin_at, end_at: data.end_at,
        has_coalition: data.has_coalition
      }.merge(
        cursus_attributes: FortyTwo::Cursus.process_payload_for_fortytwo(data.cursus),
        user_attributes: { id: data.user.id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/cursus_users/#{id}" }
  end
end
