json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :food_id, :dish_id, :quantity
  # json.url ingredient_url(ingredient, format: :json)
end
