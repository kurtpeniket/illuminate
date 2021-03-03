class Lightbulb < ApplicationRecord
  include Filterable
  scope :bulb_type, -> (bulb_type) { where bulb_type: bulb_type }
  scope :fitting, -> (fitting) { where fitting: fitting }
  scope :brightness, -> (brightness) { where brightness: brightness }

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
