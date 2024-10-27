class CreateMealsAndIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :quantity
      t.string :notes
      t.belongs_to :meal
      t.timestamps
    end
    create_table :meals do |t|
      t.string :name
      t.string :notes
      t.belongs_to :user
      t.timestamps
    end
  end
end
