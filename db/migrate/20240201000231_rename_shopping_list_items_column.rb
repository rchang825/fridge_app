class RenameShoppingListItemsColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :shopping_list_items, :category, :creator
  end
end
