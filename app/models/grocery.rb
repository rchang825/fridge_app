class Grocery < ApplicationRecord
  self.primary_key = :name
  has_many :fridge_items, foreign_key: 'grocery_name'
  #belongs_to :user
end
