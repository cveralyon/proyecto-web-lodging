json.extract! user, :id, :email, :first_name, :last_name, :rut, :password
json.lodgings user.lodgings, :id, :name, :description, :daily_fee, :location, :pets_accepted,
              :parking_lot, :breakfast_included, :single_bed, :double_bed, :rooms, :bathrooms, :jacuzzi, :gym,
              :smoke_free