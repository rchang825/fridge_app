class FridgeItem < ApplicationRecord
    belongs_to :user
    belongs_to :grocery, foreign_key: 'grocery_name'
    has_and_belongs_to_many :tags
    validates :expiration_date, format: { with: /\A(0[1-9]|1[0-2]|[1-9])\/(0[1-9]|[1-2]\d|3[0-1]|[1-9])\/\d\d\z/,
    message: "accepted format: MM/DD/YY" }, :allow_blank => true
end
