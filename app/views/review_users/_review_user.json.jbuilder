json.extract! review_user, :id, :text, :rating, :is_a_guest, :created_at, :updated_at
json.url review_user_url(review_user, format: :json)
