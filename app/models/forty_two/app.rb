class FortyTwo::App < ApplicationRecord
  serialize :scopes, Array

  belongs_to :owner, class_name: 'FortyTwo::User'

  has_and_belongs_to_many :roles, class_name: 'FortyTwo::Role', dependent: :destroy

  has_many :tokens, class_name: 'Token',          dependent: :destroy
  has_many :logs,   class_name: 'Log',            through: :tokens

  rails_admin do
    configure :secret do
      hide
    end
  end

  def local?
    self.uid == Secrets.get(:forty_two, :client_uid)
  end
end
