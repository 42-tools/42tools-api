class Role < ApplicationRecord
  belongs_to :app, class_name: 'FortyTwo::App'

  enum slug: { admin: 0, certified: 1 }
end
