json.array!(@foods) do |food|
  json.extract! food, :id, :name, :price, :food_group_id
  json.url food_url(food, format: :json)
end
