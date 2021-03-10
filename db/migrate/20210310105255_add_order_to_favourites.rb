class AddOrderToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_column :favourites, :order, :integer
  end
end
