class Log < ApplicationRecord
  belongs_to :linkable, polymorphic: true
  serialize :data, Hash
end
