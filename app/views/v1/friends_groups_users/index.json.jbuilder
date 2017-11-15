json.array! @friends_groups_users do |friends_groups_user|
  json.extract! friends_groups_user.friends_user.friend, :id, :login
end
