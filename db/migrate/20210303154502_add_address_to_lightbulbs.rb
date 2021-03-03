class AddAddressToLightbulbs < ActiveRecord::Migration[6.0]
  def change
    add_column :lightbulbs, :address, :string
  end
end
