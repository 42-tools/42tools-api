class FriendsUserJob < ApplicationJob
  queue_as :user

  def perform(owner_id, friend_id, user_payload = nil)
    UserJob.perform_now(friend_id, user_payload) unless FortyTwo::User.exists?(friend_id)
    FriendsUser.find_or_create_by!(owner_id: owner_id, friend_id: friend_id)
  end
end
