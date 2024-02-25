class CreateGroceryTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :grocery_taggings do |t|

      t.timestamps
      t.integer :grocery_id
      t.integer :tag_id
      t.index [:grocery_id, :tag_id]
      t.index [:tag_id, :grocery_id]
    end
  end
end
