class CreateWarehouses < ActiveRecord::Migration[5.0]
  def change
    create_table :warehouses do |t|
      t.string :venue_name
      t.string :location
      t.integer :num_exits
      t.integer :max_occupants
      t.integer :square_feet
      t.boolean :fire_alarm, default: true
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
