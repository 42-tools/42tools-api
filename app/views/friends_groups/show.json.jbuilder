json.extract! @friends_group, :id, :name
json.users @friends_group.friends_users do |friends_user|
  json.extract! friends_user.friend, :id, :login
end
