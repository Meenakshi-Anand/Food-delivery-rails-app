class Menu < ApplicationRecord
  validates :meal_category , presence:true
  enum status: ['breakfast','lunch','dinner']
  belongs_to :restaurant
  has_and_belongs_to_many :food_items

end
