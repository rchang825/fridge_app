class FridgeItem < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :grocery, optional: true
    #has_and_belongs_to_many :tags
    has_one :shopping_list_item
    has_many :tags, through: :grocery
    has_one :ingredient
    validates :expiration_date, format: { with: /\A(0[1-9]|1[0-2]|[1-9])\/(0[1-9]|[1-2]\d|3[0-1]|[1-9])\/\d\d\z/,
    message: "accepted format: MM/DD/YY" }, :allow_blank => true

    def fridge_tags
        tags.map(&:name).join(" ")
    end
end
