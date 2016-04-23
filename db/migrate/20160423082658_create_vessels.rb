class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.integer :organization_id
      t.string :name
      t.integer :total_cages_lost, default: 0

      t.timestamps null: false
    end

    add_index :vessels, :organization_id
  end
end
