json.extract! @friends_user.friend, :id, :login
json.added_at @friends_user.created_at
json.groups @friends_user.friends_groups do |friends_group|
  json.extract! friends_group, :id, :name
end
