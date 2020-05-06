class Restaurant < ApplicationRecord
  has_one :user , as: :entity
  has_many :working_hours
  has_many :menus
  has_many :carts
  has_many :orders
  has_one :address, through: :user

  
end
