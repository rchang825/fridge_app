class CreateShoppingListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_list_items do |t|
      t.string :name
      t.decimal :quantity
      t.string :category

      t.timestamps
    end
  end
end
