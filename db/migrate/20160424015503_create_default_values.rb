class CreateDefaultValues < ActiveRecord::Migration
  def change
    create_table :default_values do |t|
      change_column_default(:gears, :missing, false)
      change_column_default(:gear_locations, :private_sharing, true)
    end
  end
end
