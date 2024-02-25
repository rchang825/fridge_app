class GroceryTagging < ApplicationRecord
  belongs_to :grocery
  belongs_to :tag
end
