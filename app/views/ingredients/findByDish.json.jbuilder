json.array!(@ingredients) do |ingredient|
  json.extract! ingredient,:id, :dish_id, :quantity
  json.food ingredient.food
end