class Shop < ApplicationRecord
  has_many :orders
  has_many :lightbulbs, through: :orders
end
