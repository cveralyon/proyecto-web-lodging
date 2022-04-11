class CreateLodgings < ActiveRecord::Migration[6.1]
  def change
    create_table :lodgings do |t|
      t.string :name
      t.string :description
      t.decimal :daily_fee
      t.string :location
      t.date :availability_from
      t.date :availability_to
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
      t.decimal :latitude, default: 51.5
      t.decimal :longitude, default: -0.125

      t.timestamps
    end
  end
end
