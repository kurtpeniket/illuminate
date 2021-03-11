class AddLightbulbToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_reference :favourites, :lightbulb, null: true, foreign_key: true
    add_column :favourites, :room, :string
  end
end
