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
     result << user
    end
    result
  end

  def get_delivering_restaurants
    result = []
    res = self.get_all_restaurants
    res.each do |user|
      distance = dist([self.address.latitude,self.address.longitude],[user.address.latitude, user.address.longitude])
      # distance = self.address.distance_from([restaurant.latitude, restaurant.longitude])
      restaurant = Restaurant.find(user.entity_id)
      result << user.address if restaurant.delivery_range && distance <= restaurant.delivery_range
    end
    result
  end

  # calculate distance using haversines formula
  def dist (loc1,loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    (rm * c)/1609.344 # Delta in miles
  end

end
