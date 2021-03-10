class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :lightbulb
  before_create :set_order

  def set_order
    new_order = self.user.favourites.length + 1
    self.order = new_order
  end
end
