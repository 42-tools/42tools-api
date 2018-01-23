json.array! @groups_users do |groups_user|
  json.extract! groups_user, :id, :group_id, :user_id
end
