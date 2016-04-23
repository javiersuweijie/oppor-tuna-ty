class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :gear_type
      t.string :reg_id
      t.integer :vessel_id
      t.boolean :missing
      t.timestamp :missing_timestamp
      

      t.timestamps null: false
    end

    add_index :gears, :vessel_id
  end
end
