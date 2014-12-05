class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :food_id
      t.integer :dish_id
      t.float :quantity

      t.timestamps

    end
  end
end
