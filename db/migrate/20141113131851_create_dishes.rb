class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.float :price
      t.float :total_weight
      t.integer :dish_group_id

      t.timestamps
    end
  end
end
