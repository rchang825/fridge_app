class AddInitialQuantityToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :initial_quantity, :decimal
  end
end
