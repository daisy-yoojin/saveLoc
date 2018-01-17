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

ActiveRecord::Schema.define(version: 20180116111541) do

  create_table "boxes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "img"
    t.decimal  "lon"
    t.decimal  "lat"
    t.string   "placeName"
    t.string   "typee"
    t.text     "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boxes", ["user_id"], name: "index_boxes_on_user_id"

  create_table "followers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "followers", ["user_id"], name: "index_followers_on_user_id"

  create_table "markers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "img"
    t.decimal  "lon"
    t.decimal  "lat"
    t.string   "placeName"
    t.string   "address"
    t.string   "classification"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "markers", ["user_id"], name: "index_markers_on_user_id"

  create_table "notice_replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "notice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notice_replies", ["notice_id"], name: "index_notice_replies_on_notice_id"
  add_index "notice_replies", ["user_id"], name: "index_notice_replies_on_user_id"

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id"

  create_table "post_replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_replies", ["post_id"], name: "index_post_replies_on_post_id"
  add_index "post_replies", ["user_id"], name: "index_post_replies_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "services", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.string   "access_token_secret"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.text     "auth"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "services", ["user_id"], name: "index_services_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "state",                  default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
