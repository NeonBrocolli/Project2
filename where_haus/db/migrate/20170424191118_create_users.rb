class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.string :company
      t.string :password_digest
      t.attachment :image

      t.timestamps
    end
  end
end
