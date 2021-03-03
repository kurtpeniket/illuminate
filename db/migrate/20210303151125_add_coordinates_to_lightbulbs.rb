class AddCoordinatesToLightbulbs < ActiveRecord::Migration[6.0]
  def change
    add_column :lightbulbs, :latitude, :float
    add_column :lightbulbs, :longitude, :float
  end
end
