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

ActiveRecord::Schema.define(version: 20151013050455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "member_of_provincial_parliaments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "profile_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "riding_id"
    t.string   "email"
    t.string   "party"
  end

  add_index "member_of_provincial_parliaments", ["riding_id"], name: "index_member_of_provincial_parliaments_on_riding_id", using: :btree

  create_table "ministries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "imported_url"
    t.string   "imported_mailing_address"
    t.float    "imported_latitude"
    t.float    "imported_longitude"
    t.integer  "funding",                  limit: 8
    t.string   "imported_postal_code"
    t.string   "imported_riding_name"
    t.integer  "riding_id"
  end

  add_index "organizations", ["riding_id"], name: "index_organizations_on_riding_id", using: :btree

  create_table "ridings", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo_url"
    t.string   "url_safe_name"
    t.integer  "funding",       limit: 8
  end

  create_table "transfer_payments", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "organization_id"
    t.integer  "ministry_id"
    t.integer  "amount",          limit: 8
  end

  add_index "transfer_payments", ["ministry_id"], name: "index_transfer_payments_on_ministry_id", using: :btree
  add_index "transfer_payments", ["organization_id"], name: "index_transfer_payments_on_organization_id", using: :btree

  add_foreign_key "member_of_provincial_parliaments", "ridings"
  add_foreign_key "organizations", "ridings"
  add_foreign_key "transfer_payments", "ministries"
  add_foreign_key "transfer_payments", "organizations"
end
