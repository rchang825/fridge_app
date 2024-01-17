class FridgeItem < ApplicationRecord
    belongs_to :user
    belongs_to :grocery, foreign_key: 'grocery_name'
end
