class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          has_many :fridge_items, dependent: :destroy
          has_many :groceries, dependent: :destroy
          has_many :shopping_list_items, dependent: :destroy
          has_many :tags, dependent: :destroy
          has_many :meals
end
