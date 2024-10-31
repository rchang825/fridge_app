class Meal < ApplicationRecord
  DEFAULT_NAME = 'Meal'

  belongs_to :user
  has_many :ingredients, dependent: :destroy
end
