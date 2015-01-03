class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name, unique: true
      t.float :value

      t.timestamps
    end
  end
end
