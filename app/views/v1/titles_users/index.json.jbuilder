json.array! @titles_users do |titles_user|
  json.extract! titles_user, :id, :title_id, :user_id, :selected
end
