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

ActiveRecord::Schema.define(version: 20150702141016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer "manufacturer_id", null: false
    t.integer "mileage",         null: false
    t.integer "year",            null: false
    t.string  "color",           null: false
    t.text    "description"
  end

  add_index "cars", ["color"], name: "index_cars_on_color", using: :btree
  add_index "cars", ["manufacturer_id"], name: "index_cars_on_manufacturer_id", using: :btree
  add_index "cars", ["year"], name: "index_cars_on_year", using: :btree

  create_table "manufacturers", force: :cascade do |t|
    t.string "name",    null: false
    t.string "country", null: false
  end

  add_index "manufacturers", ["country"], name: "index_manufacturers_on_country", unique: true, using: :btree
  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name", unique: true, using: :btree

end
