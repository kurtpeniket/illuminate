class CreateLightbulbs < ActiveRecord::Migration[6.0]
  def change
    create_table :lightbulbs do |t|
      t.string :type
      t.string :fitting
      t.integer :brightness
      t.string :image
      t.string :url
      t.string :brand

      t.timestamps
    end
  end
end
