class Ingredient < ApplicationRecord
  belongs_to :meal
  belongs_to :source_fridge_item, class_name: "Fridge_Item", optional: true
end
