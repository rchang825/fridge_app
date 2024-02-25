class Tag < ApplicationRecord
  has_many :grocery_taggings
  has_many :groceries, through: :grocery_taggings
end
