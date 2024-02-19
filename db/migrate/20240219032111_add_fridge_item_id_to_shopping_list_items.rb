class AddFridgeItemIdToShoppingListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :shopping_list_items, :fridge_item_id, :integer
    add_index :shopping_list_items, :fridge_item_id
  end
end
