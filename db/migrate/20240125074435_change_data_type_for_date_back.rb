class ChangeDataTypeForDateBack < ActiveRecord::Migration[7.1]
  def change
    change_column :fridge_items, :expiration_date, :string
  end
end
