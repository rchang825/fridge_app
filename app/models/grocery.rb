class Grocery < ApplicationRecord
  #self.primary_key = :name
  has_many :fridge_items
  belongs_to :user
end
