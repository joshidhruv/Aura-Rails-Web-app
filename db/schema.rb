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

ActiveRecord::Schema.define(version: 20140513223056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addons", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guest_id"
    t.integer  "host_id"
    t.integer  "location_id"
    t.integer  "service_id"
    t.decimal  "cost"
    t.datetime "datetime_begin"
    t.datetime "datetime_end"
    t.boolean  "notification_on"
    t.datetime "next_notification"
    t.boolean  "notification_sent"
    t.boolean  "accepted"
    t.boolean  "paid"
    t.boolean  "completed"
    t.integer  "company_id"
    t.boolean  "cancelled"
  end

  create_table "companies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "location_hours", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day_of_week"
    t.string   "open"
    t.string   "close"
    t.integer  "location_id"
    t.binary   "closed"
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.boolean  "primary"
  end

  create_table "locations_services", id: false, force: true do |t|
    t.integer "service_id",  null: false
    t.integer "location_id", null: false
  end

  create_table "locations_users", id: false, force: true do |t|
    t.integer "user_id",     null: false
    t.integer "location_id", null: false
  end

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appointment_id"
    t.integer  "cost"
    t.boolean  "status"
  end

  create_table "roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "minutes_duration"
    t.boolean  "all_staff"
  end

  create_table "user_services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "business_name"
    t.integer  "company_id"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "color"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
