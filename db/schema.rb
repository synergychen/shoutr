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

ActiveRecord::Schema.define(version: 20141017134703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "shout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["user_id", "shout_id"], name: "index_favorites_on_user_id_and_shout_id", unique: true, using: :btree

  create_table "following_relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "following_relationships", ["follower_id", "followed_user_id"], name: "unique_index_on_followers", unique: true, using: :btree

  create_table "image_subjects", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shouts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id",   null: false
    t.string   "subject_type", null: false
  end

  add_index "shouts", ["user_id"], name: "index_shouts_on_user_id", using: :btree

  create_table "text_subjects", force: true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
