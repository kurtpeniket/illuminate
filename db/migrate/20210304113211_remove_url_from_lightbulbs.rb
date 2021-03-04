class RemoveUrlFromLightbulbs < ActiveRecord::Migration[6.0]
  def change
    remove_column :lightbulbs, :url, :string
  end
end
