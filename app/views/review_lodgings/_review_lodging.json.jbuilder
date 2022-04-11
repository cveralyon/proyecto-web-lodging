json.extract! review_lodging, :id, :text, :rating, :created_at, :updated_at
json.url review_lodging_url(review_lodging, format: :json)
