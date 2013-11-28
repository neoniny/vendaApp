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

ActiveRecord::Schema.define(version: 20131126075138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string "client_name"
    t.string "entprs_name"
  end

  create_table "frequencies", force: true do |t|
    t.string "api_ref"
    t.string "tier3"
    t.string "tier2"
    t.string "tier1"
  end

  create_table "interface_lists", force: true do |t|
    t.string "ref"
    t.string "api_name"
    t.string "api_type"
    t.text   "definition"
  end

  create_table "interfaces", force: true do |t|
    t.string "api_version"
    t.string "api_ref"
    t.string "api_name"
    t.string "api_type"
    t.string "ymlname"
  end

  create_table "item_defs", force: true do |t|
    t.string   "requirement_id"
    t.string   "request_type"
    t.string   "interface_id"
    t.string   "transport_type"
    t.string   "notification"
    t.string   "encryption"
    t.string   "job_frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirements", force: true do |t|
    t.string   "entprs_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
