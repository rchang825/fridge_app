class CreateFridgeItems < ActiveRecord::Migration[7.1]
  def change
    create_table :fridge_items do |t|
      t.string :item_name
      t.decimal :item_quantity
      t.string :expiration_date
      t.string :notes

      t.timestamps
    end
  end
end
