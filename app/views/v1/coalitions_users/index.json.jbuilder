json.array! @coalitions_users do |coalitions_user|
  json.extract! coalitions_user, :id, :coalition_id, :user_id
end
