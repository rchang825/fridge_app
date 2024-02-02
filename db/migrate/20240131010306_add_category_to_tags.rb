class AddCategoryToTags < ActiveRecord::Migration[7.1]
  def change
    add_column :tags, :category, :string
  end
end
