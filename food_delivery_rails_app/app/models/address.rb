class Address < ActiveRecord::Base

  # geocode with a method
  geocoded_by :full_street_address

  # the callback to set longitude and latitude
  after_validation :geocode

  validates :line1, :city, :state, :country, :zipcode, presence: true

  belongs_to :user
  has_many :restaurants, through: :user
  has_many :consumers, through: :user

  def full_street_address
    "#{self.line1}, #{self.zipcode}, #{self.city}, #{self.country}"
  end

end
