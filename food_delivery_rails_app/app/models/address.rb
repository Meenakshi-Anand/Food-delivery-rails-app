class Address < ActiveRecord::Base

  validates :line1, :city, :state, :country, :zipcode, presence: true

  belongs_to :user
  has_many :restaurants, through: :user
  has_many :consumers, through: :user

  def full_street_address
    "#{self.line1}, #{self.zipcode}, #{self.city}, #{self.country}"
  end

  # calculate distance using haversines formula
  def distance_from (address)
    loc1 = [self.latitude,self.longitude]
    loc2 = [address.latitude,address.longitude]
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
