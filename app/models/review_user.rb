class ReviewUser < ApplicationRecord
  belongs_to :received, class_name: 'User', foreign_key: 'received_id'
  belongs_to :made, class_name: 'User', foreign_key: 'made_id'
end
