json.array! @tokens do |token|
  json.extract! token, :id, :app_id, :user_id, :created_at
end
