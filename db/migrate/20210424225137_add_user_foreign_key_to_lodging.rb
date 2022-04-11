class AddUserForeignKeyToLodging < ActiveRecord::Migration[6.1]
  def change
    add_reference :lodgings, :user, null: false, foreign_key: true
  end
end
