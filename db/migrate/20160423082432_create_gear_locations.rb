class CreateGearLocations < ActiveRecord::Migration
  def change
    create_table :gear_locations do |t|
      t.decimal :lng
      t.decimal :lat
      t.integer :gear_id
      t.boolean :private_sharing

      t.timestamps null: false
    end

    add_index :gear_locations, :gear_id
  end
end
