class Shop < ApplicationRecord
  has_many :orders
  has_many :lightbulbs, through: :orders

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
