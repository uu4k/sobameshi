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

ActiveRecord::Schema.define(version: 20150823113631) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id", "created_at"], name: "index_comments_on_post_id_and_created_at"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["post_id"], name: "index_favorites_on_post_id"
  add_index "favorites", ["user_id", "post_id"], name: "index_favorites_on_user_id_and_post_id", unique: true
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "content"
    t.decimal  "latitude",   precision: 9, scale: 6
    t.decimal  "longitude",  precision: 9, scale: 6
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "posts", ["latitude", "longitude"], name: "index_posts_on_latitude_and_longitude"
  add_index "posts", ["store_id", "created_at"], name: "index_posts_on_store_id_and_created_at"
  add_index "posts", ["store_id"], name: "index_posts_on_store_id"
  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude",   precision: 9, scale: 6
    t.decimal  "longitude",  precision: 9, scale: 6
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "stores", ["latitude", "longitude"], name: "index_stores_on_latitude_and_longitude"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end