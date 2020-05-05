class Restaurant < ApplicationRecord
  has_one :user , as: :entity
  has_many :working_hours
  has_many :food_items
  has_many :orders 
end
