# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160423050908) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id_id",   limit: 4
    t.integer  "employee_id_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "accounts", ["client_id_id"], name: "index_accounts_on_client_id_id", using: :btree
  add_index "accounts", ["employee_id_id"], name: "index_accounts_on_employee_id_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "credit_card_no", limit: 255
    t.integer  "rating",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "employees", force: :cascade do |t|
    t.text     "bio",         limit: 65535
    t.integer  "hourly_rate", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "hidden_stop_orders", force: :cascade do |t|
    t.integer  "price_per_share", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "market_on_close_orders", force: :cascade do |t|
    t.string   "buy_sell_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "market_orders", force: :cascade do |t|
    t.string   "buy_sell_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "num_shares",      limit: 4
    t.integer  "transaction_fee", limit: 4
    t.boolean  "completed"
    t.integer  "account_id",      limit: 4
    t.integer  "employee_id",     limit: 4
    t.integer  "stock_id",        limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "owns_stocks", force: :cascade do |t|
    t.integer  "num_shares",      limit: 4
    t.decimal  "price_per_share",           precision: 2
    t.integer  "account_id_id",   limit: 4
    t.integer  "stock_id_id",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "company_name",    limit: 255
    t.string   "stock_symbol",    limit: 255
    t.string   "stock_type",      limit: 255
    t.decimal  "price_per_share",             precision: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "trailing_stop_orders", force: :cascade do |t|
    t.integer  "price_per_share", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "ssn",             limit: 255
    t.string   "last_name",       limit: 255
    t.string   "first_name",      limit: 255
    t.string   "address",         limit: 255
    t.string   "zipcode",         limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "telephone",       limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
