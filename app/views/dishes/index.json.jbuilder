json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :price, :total_weight, :dish_group_id
  json.url dish_url(dish, format: :json)
end
