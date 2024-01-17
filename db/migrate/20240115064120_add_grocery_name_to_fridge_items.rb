class AddGroceryNameToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :grocery_name, :string
  end
end
