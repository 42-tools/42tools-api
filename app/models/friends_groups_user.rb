class FriendsGroupsUser < ApplicationRecord
  belongs_to :friends_group
  belongs_to :friends_user

  rails_admin do
    object_label_method -> { friends_user.user.login }
  end
end
