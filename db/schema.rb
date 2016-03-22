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

ActiveRecord::Schema.define(version: 20160322164147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bonus_ranges", force: :cascade do |t|
    t.decimal  "min_value",  precision: 18, scale: 4
    t.decimal  "max_value",  precision: 18, scale: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "bonus_ranges", ["max_value"], name: "index_bonus_ranges_on_max_value", using: :btree
  add_index "bonus_ranges", ["min_value"], name: "index_bonus_ranges_on_min_value", using: :btree

  create_table "bonuses", force: :cascade do |t|
    t.integer  "bonus_range_id",                          null: false
    t.integer  "month",                                   null: false
    t.integer  "year",                                    null: false
    t.string   "type",                                    null: false
    t.decimal  "bonus_value",    precision: 18, scale: 4, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "bonuses", ["bonus_range_id"], name: "index_bonuses_on_bonus_range_id", using: :btree

  create_table "ev_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evs", force: :cascade do |t|
    t.integer  "ev_type_id",                                null: false
    t.string   "model",                                     null: false
    t.decimal  "battery_capacity", precision: 18, scale: 4, null: false
    t.decimal  "charging_power",   precision: 18, scale: 4, null: false
    t.decimal  "consumption",      precision: 18, scale: 4, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "evs", ["ev_type_id"], name: "index_evs_on_ev_type_id", using: :btree
  add_index "evs", ["model"], name: "index_evs_on_model", using: :btree

  create_table "free_on_self_consumptions", force: :cascade do |t|
    t.integer  "year",                                                       null: false
    t.decimal  "up_10_kwp",                         precision: 18, scale: 4, null: false
    t.decimal  "payable_share_on_self_consumption", precision: 18, scale: 4, null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "free_on_self_consumptions", ["year"], name: "index_free_on_self_consumptions_on_year", using: :btree

  create_table "pv_productions", force: :cascade do |t|
    t.string   "zip_code_start",                             null: false
    t.string   "zip_code_stop"
    t.decimal  "pv_production_sum", precision: 18, scale: 4, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pv_productions", ["zip_code_start"], name: "index_pv_productions_on_zip_code_start", using: :btree
  add_index "pv_productions", ["zip_code_stop"], name: "index_pv_productions_on_zip_code_stop", using: :btree

end
