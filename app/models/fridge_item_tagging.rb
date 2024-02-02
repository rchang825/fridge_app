class FridgeItemTagging < ApplicationRecord
  belongs_to :fridge_item
  belongs_to :tag
end
