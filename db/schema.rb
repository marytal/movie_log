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

ActiveRecord::Schema.define(version: 20141112172430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "poster"
    t.integer  "length"
    t.integer  "year"
    t.text     "description"
    t.date     "date_watched"
    t.string   "watched_with"
    t.integer  "your_rating"
    t.integer  "average_rating"
    t.string   "notes"
    t.integer  "times_watched"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploaded_images", force: true do |t|
    t.binary   "image",      null: false
    t.string   "mime_type",  null: false
    t.integer  "user_id"
    t.integer  "movie_id"
    t.string   "used_for"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                                                                               null: false
    t.string   "email",                                                                                              null: false
    t.string   "password_hash",                                                                                      null: false
    t.string   "profile_picture", default: "http://cdn.cutestpaw.com/wp-content/uploads/2012/01/silly-turtle-l.jpg"
    t.string   "sex"
    t.string   "share_status",    default: "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
