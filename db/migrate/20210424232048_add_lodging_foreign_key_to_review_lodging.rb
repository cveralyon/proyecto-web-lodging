class AddLodgingForeignKeyToReviewLodging < ActiveRecord::Migration[6.1]
  def change
    add_reference :review_lodgings, :lodging, foreign_key: true
    add_reference :review_lodgings, :user, foreign_key: true

  end
end
