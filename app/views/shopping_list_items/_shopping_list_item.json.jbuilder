json.extract! shopping_list_item, :id, :name, :quantity, :creator, :created_at, :updated_at
json.url shopping_list_item_url(shopping_list_item, format: :json)
