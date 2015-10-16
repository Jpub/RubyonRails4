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

ActiveRecord::Schema.define(version: 20140118053815) do

  create_table "authors", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "birth"
    t.text     "address"
    t.string   "ctype"
    t.binary   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["user_id"], name: "index_authors_on_user_id"

  create_table "authors_books", id: false, force: true do |t|
    t.integer "author_id", null: false
    t.integer "book_id",   null: false
  end

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "title"
    t.integer  "price"
    t.string   "publish"
    t.date     "published"
    t.boolean  "cd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fan_comments", force: true do |t|
    t.integer  "author_no"
    t.string   "name"
    t.text     "body"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "lock_version", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memos", force: true do |t|
    t.string   "memoable_type"
    t.integer  "memoable_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.string   "email"
    t.boolean  "dm"
    t.string   "roles"
    t.integer  "reviews_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
