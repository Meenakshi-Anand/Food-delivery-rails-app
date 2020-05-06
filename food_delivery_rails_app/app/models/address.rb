class Address < ApplicationRecord
  validates :line1, :city, :state, :country, :zipcode, presence: true
  belongs_to :user

  has_many :restaurants, through: :user
  has_many :consumers, through: :user

end
