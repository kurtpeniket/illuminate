class AddPriceToLightbulbs < ActiveRecord::Migration[6.0]
  def change
    add_column :lightbulbs, :price, :string
  end
end
