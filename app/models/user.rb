class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favourites
  after_create :create_rooms

  def create_rooms
    Favourite.create(user: self, room: "Kitchen", order: 1)
    Favourite.create(user: self, room: "Living room", order: 2)
    Favourite.create(user: self, room: "Bathroom", order: 3)
  end
end
