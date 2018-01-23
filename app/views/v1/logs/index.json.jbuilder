json.array! @logs do |log|
  json.extract! log, :id, :linkable_type, :linkable_id, :created_at
end
