json.array! @titles do |title|
  json.extract! title, :id, :name
end
