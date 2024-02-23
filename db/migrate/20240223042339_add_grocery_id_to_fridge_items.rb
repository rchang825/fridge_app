class AddGroceryIdToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :grocery_id, :integer
    add_index :fridge_items, :grocery_id
  end
end
