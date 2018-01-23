class App < ApplicationRecord
  has_many :apps_tokens, dependent: :destroy
  has_many :apps_roles, dependent: :destroy
  has_many :logs, through: :apps_tokens

  AppsRole.slugs.keys.each do |slug|
    class_eval <<-METHODS, __FILE__, __LINE__ + 1
      def #{slug}?
        apps_roles.exists?(slug: '#{slug}')
      end
    METHODS
  end
end
