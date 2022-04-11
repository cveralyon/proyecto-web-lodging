class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :subject
      t.string :text
      t.string :file

      t.timestamps
    end
  end
end
