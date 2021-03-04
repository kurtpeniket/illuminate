class RemoveAddressFromLightbulbs < ActiveRecord::Migration[6.0]
  def change
    remove_column :lightbulbs, :latitude, :float
    remove_column :lightbulbs, :longitude, :float
    remove_column :lightbulbs, :address, :string
  end
end
