json.array! @apps do |app|
  json.extract! app, :id, :name
end
