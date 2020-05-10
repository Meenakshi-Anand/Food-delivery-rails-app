class AddressWorker < ApplicationRecord
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(address_id)
    address = Address.find(address_id)
    coordinates = Geocoder.coordinates(address.zipcode)
    address.latitude = coordinates[0]
    address.longitude = coordinates[1]
    address.save!
  end
end
