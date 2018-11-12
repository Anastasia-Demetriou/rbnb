# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_12_162315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.decimal "price"
    t.string "description"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bids_on_event_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "bid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bid_id"], name: "index_bookings_on_bid_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "event_type"
    t.string "location"
    t.string "description"
    t.integer "party_size"
    t.string "service"
    t.integer "max_price"
    t.integer "min_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "bio"
    t.boolean "event_organiser"
    t.string "service"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "events"
  add_foreign_key "bids", "users"
  add_foreign_key "bookings", "bids"
  add_foreign_key "events", "users"
end
