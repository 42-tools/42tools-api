json.array! @projects_users_cursus do |projects_users_cursus|
  json.extract! projects_users_cursus, :id, :projects_user_id, :cursus_id
end
