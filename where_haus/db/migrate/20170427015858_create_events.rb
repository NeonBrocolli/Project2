class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :date
      t.integer :price
      t.references :user, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.attachment :image

      t.timestamps
    end
  end
end
