class AddUserToGroceryAndShoppingListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :groceries, :user_id, :integer
    add_index :groceries, :user_id
    add_column :shopping_list_items, :user_id, :integer
    add_index :shopping_list_items, :user_id
  end
end
