json.array! @languages_users do |languages_user|
  json.extract! languages_user, :id, :language_id, :user_id, :position
end
