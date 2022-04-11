class CreateReviewUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :review_users do |t|
      t.string :text
      t.float :rating
      t.boolean :is_a_guest

      t.timestamps
    end
  end
end
