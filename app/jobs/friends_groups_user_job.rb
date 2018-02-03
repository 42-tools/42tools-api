class FriendsGroupsUserJob < ApplicationJob
  queue_as :user

  def perform(owner_id, friends_group_id, friend_id, user_payload = nil)
    friends_user = FriendsUser.find_by(owner_id: owner_id, friend_id: friend_id)
    friends_user ||= FriendsUserJob.perform_now(owner_id, friend_id, user_payload)

    FriendsGroupsUser.find_or_create_by!(friends_group_id: friends_group_id, friends_user: friends_user)
  end
end
