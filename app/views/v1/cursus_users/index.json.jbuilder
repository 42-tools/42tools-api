json.array! @cursus_users do |cursus_user|
  json.extract! cursus_user, :id, :cursus_id, :user_id
end
