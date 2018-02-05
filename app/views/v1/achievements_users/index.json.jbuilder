json.array! @achievements_users do |achievements_user|
  json.extract! achievements_user, :id, :achievement_id, :user_id
end
