class RemoveLightbulbFromFavourites < ActiveRecord::Migration[6.0]
  def change
    remove_reference :favourites, :lightbulb
  end
end
