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


ActiveRecord::Schema[7.0].define(version: 2023_08_25_073229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.string "name"
    t.integer "balance"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_accounts_on_business_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name_busines"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "earnings", force: :cascade do |t|
    t.bigint "movements_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movements_id"], name: "index_earnings_on_movements_id"
  end

  create_table "egresses", force: :cascade do |t|
    t.bigint "movements_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movements_id"], name: "index_egresses_on_movements_id"
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "accounts_id", null: false
    t.integer "balance"
    t.string "currency"
    t.integer "category"
    t.string "beneficiary"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounts_id"], name: "index_movements_on_accounts_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.bigint "movements_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movements_id"], name: "index_transfers_on_movements_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "businesses"
  add_foreign_key "businesses", "users"
  add_foreign_key "earnings", "movements", column: "movements_id"
  add_foreign_key "egresses", "movements", column: "movements_id"
  add_foreign_key "movements", "accounts", column: "accounts_id"
  add_foreign_key "transfers", "movements", column: "movements_id"
end