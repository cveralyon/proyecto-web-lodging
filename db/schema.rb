# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2021_06_20_225125) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "daily_fee"
    t.string "location"
    t.date "availability_from"
    t.date "availability_to"
    t.boolean "pets_accepted"
    t.boolean "parking_lot"
    t.boolean "breakfast_included"
    t.integer "single_bed"
    t.integer "double_bed"
    t.integer "rooms"
    t.integer "bathrooms"
    t.boolean "jacuzzi"
    t.boolean "gym"
    t.boolean "smoke_free"
    t.decimal "latitude", default: "51.5"
    t.decimal "longitude", default: "-0.125"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_lodgings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "messageSender_id"
    t.integer "messageReceiver_id"
    t.index ["messageReceiver_id"], name: "index_messages_on_messageReceiver_id"
    t.index ["messageSender_id"], name: "index_messages_on_messageSender_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "subject"
    t.string "text"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reportSender_id"
    t.integer "reportReceiver_id"
    t.index ["reportReceiver_id"], name: "index_reports_on_reportReceiver_id"
    t.index ["reportSender_id"], name: "index_reports_on_reportSender_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "entry_date"
    t.date "departure_date"
    t.integer "price"
    t.boolean "transfer_receipt"
    t.date "reserve_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "lodging_id", null: false
    t.index ["lodging_id"], name: "index_reservations_on_lodging_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "review_lodgings", force: :cascade do |t|
    t.string "text"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lodging_id"
    t.integer "user_id"
    t.index ["lodging_id"], name: "index_review_lodgings_on_lodging_id"
    t.index ["user_id"], name: "index_review_lodgings_on_user_id"
  end

  create_table "review_users", force: :cascade do |t|
    t.string "text"
    t.float "rating"
    t.boolean "is_a_guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "received_id"
    t.integer "made_id"
    t.index ["made_id"], name: "index_review_users_on_made_id"
    t.index ["received_id"], name: "index_review_users_on_received_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.date "check_in"
    t.date "check_out"
    t.decimal "daily_fee_min"
    t.decimal "daily_fee_max"
    t.string "location"
    t.boolean "pets_accepted"
    t.boolean "parking_lot"
    t.boolean "breakfast_included"
    t.integer "single_bed"
    t.integer "double_bed"
    t.integer "rooms"
    t.integer "bathrooms"
    t.boolean "jacuzzi"
    t.boolean "gym"
    t.boolean "smoke_free"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "rut"
    t.string "password"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lodgings", "users"
  add_foreign_key "messages", "users", column: "messageReceiver_id"
  add_foreign_key "messages", "users", column: "messageSender_id"
  add_foreign_key "reports", "users", column: "reportReceiver_id"
  add_foreign_key "reports", "users", column: "reportSender_id"
  add_foreign_key "reservations", "lodgings"
  add_foreign_key "reservations", "users"
  add_foreign_key "review_lodgings", "lodgings"
  add_foreign_key "review_lodgings", "users"
  add_foreign_key "review_users", "users", column: "made_id"
  add_foreign_key "review_users", "users", column: "received_id"
end
