class FortyTwo::GroupsUser < ApplicationRecord
  belongs_to :group,  class_name: 'FortyTwo::Group'
  belongs_to :user,   class_name: 'FortyTwo::User'
end
