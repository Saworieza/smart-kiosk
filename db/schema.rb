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

ActiveRecord::Schema.define(version: 20150308193443) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.boolean  "enabled"
    t.string   "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "number_of_items", default: 0, null: false
    t.string   "avatar"
    t.integer  "vendor_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "price",           default: 0, null: false
    t.string   "description"
  end

  add_index "items", ["vendor_id"], name: "index_items_on_vendor_id"

  create_table "kiosks", force: :cascade do |t|
    t.string   "unique_id",       null: false
    t.string   "beacon_uuid",     null: false
    t.integer  "store_id"
    t.integer  "vendor_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "password_digest"
  end

  add_index "kiosks", ["store_id"], name: "index_kiosks_on_store_id"
  add_index "kiosks", ["unique_id"], name: "index_kiosks_on_unique_id", unique: true
  add_index "kiosks", ["vendor_id"], name: "index_kiosks_on_vendor_id"

  create_table "stores", force: :cascade do |t|
    t.string   "address",    default: "", null: false
    t.integer  "vendor_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "revenue",    default: 0,  null: false
    t.integer  "cost",       default: 0,  null: false
  end

  add_index "stores", ["vendor_id"], name: "index_stores_on_vendor_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
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
    t.integer  "points",                 default: 0,  null: false
    t.integer  "level",                  default: 0,  null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vendors", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  add_index "vendors", ["confirmation_token"], name: "index_vendors_on_confirmation_token", unique: true
  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true

end
