class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.date :check_in
      t.date :check_out
      t.decimal :daily_fee_min
      t.decimal :daily_fee_max
      t.string :location
      t.boolean :pets_accepted
      t.boolean :parking_lot
      t.boolean :breakfast_included
      t.integer :single_bed
      t.integer :double_bed
      t.integer :rooms
      t.integer :bathrooms
      t.boolean :jacuzzi
      t.boolean :gym
      t.boolean :smoke_free

      t.timestamps
    end
  end
end
