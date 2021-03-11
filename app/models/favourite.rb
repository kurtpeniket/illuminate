class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :lightbulb, optional: true
  before_create :set_order

  def set_order
    if self.order.nil?
      new_order = self.user.favourites.length + 1
      self.order = new_order
    end
  end
end
