class FriendsGroupsUser < ApplicationRecord
  belongs_to :friends_group
  belongs_to :friends_user

  rails_admin do
    object_label_method :rails_admin_friends_user
  end

  private

  def rails_admin_friends_user
    friends_user.friend.login
  end
end
