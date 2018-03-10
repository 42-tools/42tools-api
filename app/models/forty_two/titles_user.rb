class FortyTwo::TitlesUser < ApplicationRecord
  include FortytwoConcern

  belongs_to :title,  class_name: 'FortyTwo::Title'
  belongs_to :user,   class_name: 'FortyTwo::User'

  accepts_nested_attributes_for :title
  accepts_nested_attributes_for :user

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id,
        user_id:  data.user_id, title_id: data.title_id,
        selected: data.selected,
      }.merge(
        title_attributes: { id: data.title_id },
        user_attributes: { id: data.user_id }
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/titles_users/#{id}" }
  end
end
