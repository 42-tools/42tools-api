class FriendsUserJob < ApplicationJob
  queue_as :user

  def perform(owner_id, friend_id, user_payload = nil)
    if user_payload
      user_data = JSON.parse(user_payload, object_class: Intra42::DataStruct)
    else
      user_payload = Intra42.instance.get("/v2/users/#{friend_id}")

      return unless user_payload.success?

      user_data = user_payload.body
    end

    unless User.exists?(friend_id)
      UserJob.perform_now(friend_id, user_data.to_json)
    end

    FriendsUser.find_or_create_by!(owner_id: owner_id, friend_id: friend_id)
  end
end
