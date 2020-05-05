class Address < ApplicationRecord
  validates :line1, :city, :state, :country, :zipcode, presence: true
  belongs_to :user 
end
