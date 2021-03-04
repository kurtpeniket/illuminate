class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :url
      t.references :shop, null: false, foreign_key: true
      t.references :lightbulb, null: false, foreign_key: true

      t.timestamps
    end
  end
end
