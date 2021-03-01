class ChangeTypeInLightbulbs < ActiveRecord::Migration[6.0]
  def change
    rename_column :lightbulbs, :type, :bulb_type
  end
end
