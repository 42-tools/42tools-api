json.array! @coalitions do |coalition|
  json.extract! coalition, :id, :name, :slug, :image_url, :color, :score, :master_id
end
