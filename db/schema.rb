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

ActiveRecord::Schema.define(version: 20140325224535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundles", force: true do |t|
    t.integer  "cashier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "transaction_total"
  end

  create_table "cashiers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_quantity"
  end

  create_table "ringups", force: true do |t|
    t.integer  "inventory_id"
    t.integer  "bundle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

end
