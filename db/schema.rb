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

ActiveRecord::Schema.define(version: 20160423090625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gear_locations", force: :cascade do |t|
    t.decimal  "lng"
    t.decimal  "lat"
    t.integer  "gear_id"
    t.boolean  "private_sharing"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "gear_locations", ["gear_id"], name: "index_gear_locations_on_gear_id", using: :btree

  create_table "gears", force: :cascade do |t|
    t.string   "gear_type"
    t.string   "reg_id"
    t.integer  "vessel_id"
    t.boolean  "missing"
    t.datetime "missing_timestamp"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "gears", ["vessel_id"], name: "index_gears_on_vessel_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.integer  "vessel_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["username"], name: "index_members_on_username", unique: true, using: :btree
  add_index "members", ["vessel_id"], name: "index_members_on_vessel_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vessels", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.integer  "total_cages_lost", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "vessels", ["organization_id"], name: "index_vessels_on_organization_id", using: :btree

end
