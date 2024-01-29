class ChangeDataTypeForDate < ActiveRecord::Migration[7.1]
  def change
    change_column :fridge_items, :expiration_date, :date
  end
end
