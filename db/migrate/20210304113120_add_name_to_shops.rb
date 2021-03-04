class AddNameToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :name, :string
  end
end
