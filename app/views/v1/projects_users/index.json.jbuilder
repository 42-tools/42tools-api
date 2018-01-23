json.array! @projects_users do |projects_user|
  json.extract! projects_user, :id, :project_id, :user_id :occurrence, :final_mark, :status, :validated
end
