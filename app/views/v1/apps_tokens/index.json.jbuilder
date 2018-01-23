json.array! @apps_tokens do |apps_token|
  json.extract! apps_token, :id, :app_id, :user_id, :created_at
end
