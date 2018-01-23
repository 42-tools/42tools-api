json.array! @campus_users do |campus_user|
  json.extract! campus_user, :id, :campus_id, :user_id, :primary
end
