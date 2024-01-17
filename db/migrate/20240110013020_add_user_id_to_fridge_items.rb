class AddUserIdToFridgeItems < ActiveRecord::Migration[7.1]
  def change
    add_column :fridge_items, :user_id, :integer
    add_index :fridge_items, :user_id
  end
end
