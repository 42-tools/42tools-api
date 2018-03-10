class FortyTwo::Title < ApplicationRecord
  include FortytwoConcern

  has_many :titles_users, class_name: 'FortyTwo::TitlesUser', dependent: :destroy
  has_many :achievements, class_name: 'FortyTwo::Achievement'

  before_destroy do |record|
    record.achievements.update_all(title_id: nil)
  end

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      {
        id: data.id, name: data.name
      }
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/titles/#{id}" }
  end
end
