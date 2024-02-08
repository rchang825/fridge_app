class AddShoppingListFlagToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :dismissed, :boolean, default: false
  end
end
