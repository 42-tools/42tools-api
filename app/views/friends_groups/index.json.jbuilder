json.array! @friends_groups do |friends_group|
  json.extract! friends_group, :id, :name
  json.user_ids friends_group.friend_ids
end
