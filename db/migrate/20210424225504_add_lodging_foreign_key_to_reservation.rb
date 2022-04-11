class AddLodgingForeignKeyToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :lodging, null: false, foreign_key: true
  end
end
