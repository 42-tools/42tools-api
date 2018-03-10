json.array! @cursus_projects_users do |cursus_projects_user|
  json.extract! cursus_projects_user, :id, :projects_user_id, :cursus_id
end
