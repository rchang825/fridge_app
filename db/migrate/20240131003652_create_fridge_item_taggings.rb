class CreateFridgeItemTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :fridge_item_taggings do |t|
      t.belongs_to :fridge_item, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
