json.array!(@dish_groups) do |dish_group|
  json.extract! dish_group, :id, :name
  json.url dish_group_url(dish_group, format: :json)
end
