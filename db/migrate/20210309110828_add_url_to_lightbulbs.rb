class AddUrlToLightbulbs < ActiveRecord::Migration[6.0]
  def change
    add_column :lightbulbs, :url, :text
  end
end
