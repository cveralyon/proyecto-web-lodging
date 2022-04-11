json.extract! lodging, :id, :name, :description, :daily_fee, :location, :pets_accepted, :parking_lot, :breakfast_included, :single_bed, :double_bed, :rooms, :bathrooms, :jacuzzi, :gym, :smoke_free, :created_at, :updated_at
json.url lodging_url(lodging, format: :json)
