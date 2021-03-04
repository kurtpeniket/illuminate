class Order < ApplicationRecord
  belongs_to :shops
  belongs_to :lightbulbs
end
