class FoodItem < ApplicationRecord
  validates :name, :price, presence:true
  belongs_to :restaurant
  has_many :cart_items
end
