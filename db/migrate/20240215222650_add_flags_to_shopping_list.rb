class AddFlagsToShoppingList < ActiveRecord::Migration[7.1]
  def change
    add_column :shopping_list_items, :checked, :boolean, default: false
    add_column :shopping_list_items, :dismissed, :boolean, default: false
  end
end
