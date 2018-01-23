json.array! @projects do |project|
  json.extract! project, :id, :name, :slug, :parent_id
end
