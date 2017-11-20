class FriendsGroupsUserJob < ApplicationJob
  queue_as :user

  def perform(owner_id, group_id, friend_id, user_payload = nil)
    if user_payload
      user_data = JSON.parse(user_payload, object_class: Intra42::DataStruct)
    else
      user_payload = Intra42.instance.get("/v2/users/#{friend_id}")

      return unless user_payload.success?

      user_data = user_payload.body
    end

    unless FriendsUser.exists?(owner_id: owner_id, friend_id: friend_id)
      FriendsUserJob.perform_now(owner_id, friend_id, user_payload.body.to_json)
    end

    friends_group = FriendsGroup.find(group_id)
    friends_user = FriendsUser.find_by!(owner_id: owner_id, friend_id: friend_id)
    FriendsGroupsUser.find_or_create_by!(friends_group: friends_group, friends_user: friends_user)
  end
end
