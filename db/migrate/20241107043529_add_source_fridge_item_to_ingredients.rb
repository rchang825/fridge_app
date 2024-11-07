class AddSourceFridgeItemToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredients, :source_fridge_item, null: true, foreign_key: { to_table: :fridge_items }
  end
end
