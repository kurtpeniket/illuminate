class Lightbulb < ApplicationRecord
  include Filterable
  scope :bulb_type, -> (bulb_type) { where bulb_type: bulb_type }
  scope :fitting, -> (fitting) { where fitting: fitting }
  scope :brightness, -> (brightness) { where brightness: brightness }
end
