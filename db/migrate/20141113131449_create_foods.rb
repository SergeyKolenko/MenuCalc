class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.integer :food_group_id

      t.timestamps
    end
  end
end
