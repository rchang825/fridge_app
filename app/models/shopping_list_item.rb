class ShoppingListItem < ApplicationRecord
  belongs_to :fridge_item, optional: true
  belongs_to :user
end
