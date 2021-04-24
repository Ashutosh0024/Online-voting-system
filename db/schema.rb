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

ActiveRecord::Schema.define(version: 2021_04_24_123529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "party"
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.integer "gender"
    t.string "aadhar_number"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "pin"
    t.string "phone"
    t.integer "vote_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "display_result", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.integer "gender"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vote_records", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "voter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_vote_records_on_candidate_id"
    t.index ["voter_id"], name: "index_vote_records_on_voter_id"
  end

  create_table "voters", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.integer "gender"
    t.string "aadhar_number"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "pin"
    t.string "phone"
    t.string "voter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "vote_records", "candidates"
  add_foreign_key "vote_records", "voters"
end
