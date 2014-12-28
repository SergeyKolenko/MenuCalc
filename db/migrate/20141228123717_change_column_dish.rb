class ChangeColumnDish < ActiveRecord::Migration
  def change
    change_column :dishes, :price, :float, default: 0.0
    change_column :dishes, :total_weight, :float, default: 0.0
  end
end
