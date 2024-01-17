json.extract! fridge_item, :id, :item_name, :item_quantity, :expiration_date, :notes, :created_at, :updated_at
json.url fridge_item_url(fridge_item, format: :json)
