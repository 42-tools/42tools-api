class AppsRole < ApplicationRecord
  belongs_to :app

  enum slug: { admin: 0, certified: 1 }
end
