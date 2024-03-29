class AddUserForeignKeyToReport < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :reportSender, foreign_key: { to_table: :users }
    add_reference :reports, :reportReceiver, foreign_key: { to_table: :users }
  end
end
