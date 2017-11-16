class FriendJob < ApplicationJob
  queue_as :user

  def perform(owner_id, friend_id)
    user_payload = Intra42.instance.get("/v2/users/#{friend_id}")

    return unless user_payload.success?

    unless User.exists?(friend_id)
      User.create!(id: friend_id)
      UserJob.perform_later(friend_id, user_payload.body.to_json)
    end

    FriendsUser.find_or_create_by!(owner_id: owner_id, friend_id: friend_id)
  end
end
