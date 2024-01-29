class FridgeItem < ApplicationRecord
    belongs_to :user
    belongs_to :grocery, foreign_key: 'grocery_name'
    validates :expiration_date, format: { with: /\A(0[1-9]|1[0-2]|[1-9])\/(0[1-9]|[1-2]\d|3[0-1]|[1-9])\/(\d\d|20\d\d)\z/,
    message: "accepted formats: MM/DD/YY and MM/DD/YYYY" }, :allow_blank => true
end
