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

ActiveRecord::Schema.define(version: 20160606201404) do

  create_table "exchanges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.boolean  "active",        default: false
    t.string   "return_time"
    t.string   "borrowed_time"
    t.string   "item_title"
  end

  create_table "instances", force: :cascade do |t|
    t.integer "protocol_id"
    t.integer "user_id"
    t.integer "amount"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "owner_location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "protocol_id"
    t.string   "category"
  end

  create_table "protocols", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",                  default: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "location"
  end

end
