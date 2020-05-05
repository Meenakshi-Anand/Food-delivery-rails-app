class Cart < ApplicationRecord
  validates order_status, presence:true
  enum order_status: ['not_ordered','ordered','order_accepted','order_denied']
  belongs_to :consumer
  belongs_to :restaurant
  has_many :cart_items
  has_one :order
end
