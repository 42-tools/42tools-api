class FortyTwo::App < ApplicationRecord
  has_many :tokens, class_name: 'Token',  dependent: :destroy
  has_many :roles,  class_name: 'Role',   dependent: :destroy
  has_many :logs,   class_name: 'Log',    through: :tokens

  rails_admin do
    configure :secret do
      hide
    end
  end

  Role.slugs.keys.each do |slug|
    class_eval <<-METHODS, __FILE__, __LINE__ + 1
      def #{slug}?
        roles.exists?(slug: '#{slug}')
      end
    METHODS
  end
end
