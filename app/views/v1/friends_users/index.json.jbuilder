json.array! @friends_users do |friends_user|
  json.extract! friends_user.friend, :id, :login
  json.group_ids friends_user.friends_group_ids
end
