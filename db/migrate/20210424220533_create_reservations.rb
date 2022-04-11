class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :entry_date
      t.date :departure_date
      t.integer :price
      t.boolean :transfer_receipt
      t.date :reserve_expiration


      t.timestamps
    end
  end
end
