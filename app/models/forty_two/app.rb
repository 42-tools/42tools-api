class FortyTwo::App < ApplicationRecord
  include FortytwoConcern

  serialize :scopes, Array

  belongs_to :owner, class_name: 'FortyTwo::User'

  has_and_belongs_to_many :roles, class_name: 'FortyTwo::Role', dependent: :destroy

  has_many :tokens, class_name: 'Token',          dependent: :destroy
  has_many :logs,   class_name: 'Log',            through: :tokens

  accepts_nested_attributes_for :owner
  accepts_nested_attributes_for :roles

  rails_admin do
    configure :secret do
      hide
    end
  end

  def local?
    self.uid == Secrets.get(:forty_two, :client_uid)
  end

  def self.process_payload_for_fortytwo(*args)
    super(*args) do |data|
      image_url = "https://cdn.intra.42.fr#{data.image.sub(%r{/uploads}, '')}"

      {
        id: data.id,
        name:      data.name,   description: data.description,
        image_url: image_url,   website:     data.website,
        public:    data.public, scopes:      data.scopes
      }.merge(
        owner_attributes: { id: data.owner.id },
        roles_attributes: FortyTwo::Role.process_payload_for_fortytwo(data.roles),
      )
    end
  end

  def self.fetch_from_fortytwo(*args)
    super(*args) { |id| "/v2/apps/#{id}" }
  end
end
