class CreateFoodDishes < ActiveRecord::Migration
  def change
    create_table :food_dishes do |t|
      t.integer :food_id
      t.integer :dish_id
      t.float :quantity

      t.timestamps
    end
  end
end
