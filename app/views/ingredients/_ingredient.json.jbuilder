json.extract! ingredient, :id, :name, :quantity, :notes, :meal_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
