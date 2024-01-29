class AddDisposedQuantityToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :disposed_quantity, :decimal
  end
end
