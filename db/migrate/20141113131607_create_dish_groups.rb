class CreateDishGroups < ActiveRecord::Migration
  def change
    create_table :dish_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
