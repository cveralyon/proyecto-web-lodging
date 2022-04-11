class AddUserForeignKeyToMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :messageSender, foreign_key: { to_table: :users }
    add_reference :messages, :messageReceiver, foreign_key: { to_table: :users }

  end
end
