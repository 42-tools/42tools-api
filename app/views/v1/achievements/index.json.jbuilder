json.array! @achievements do |achievement|
  json.extract! achievement, :id, :name, :description, :tier, :kind, :visible,
                             :image, :nbr_of_success, :parent_id
end
