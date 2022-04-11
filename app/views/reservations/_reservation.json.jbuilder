json.extract! reservation, :id, :entry_date, :departure_date, :price, :transfer_receipt, :reserve_expiration, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
