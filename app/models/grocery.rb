class Grocery < ApplicationRecord
  #self.primary_key = :name
  has_many :fridge_items
  belongs_to :user
  has_many :grocery_taggings
  has_many :tags, through: :grocery_taggings
end
