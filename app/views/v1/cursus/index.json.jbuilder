json.array! @cursus do |cursus|
  json.extract! cursus, :id, :name, :slug
end
