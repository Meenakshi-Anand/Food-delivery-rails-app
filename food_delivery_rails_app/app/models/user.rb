class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, :password_digest,:contact_no, presence: true
  # validates :password, length: {minimum: 6}, presence:true
  belongs_to :entity , polymorphic:true
  has_one :address

  def get_all_restaurants
    result = []
    User.where(entity_type:"Restaurant").find_each do |user|
     result << user.address
    end
    result
  end

  def get_delivering_restaurants
    result = []

    res = self.get_all_restaurants
    res.each do |restaurant|
      distance = self.address.distance_from([restaurant.address.latitude, restaurant.address.longitude])
      result << restaurant if restaurant.delivery_range && distance <= restaurant.delivery_range
    end
    result
  end

end
