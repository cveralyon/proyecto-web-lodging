json.extract! search, :id,:keywords, :check_in, :check_out, :daily_fee_min, :daily_fee_max, :location, :pets_accepted, :parking_lot, :breakfast_included, :single_bed, :double_bed, :rooms, :bathrooms, :jacuzzi, :gym, :smoke_free, :created_at, :updated_at
json.url search_url(search, format: :json)
