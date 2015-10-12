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

ActiveRecord::Schema.define(version: 20151012013135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "bookmark_author"
    t.text     "bookmark_excerpt"
    t.text     "bookmark_url"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.text     "image_url"
    t.integer  "width"
    t.integer  "height"
    t.datetime "taken_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.text     "image_url"
    t.integer  "duration"
    t.datetime "recorded_at"
    t.text     "enclosure_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.text     "slug"
    t.text     "in_reply_to"
    t.text     "tags"
    t.datetime "published_at"
    t.boolean  "private"
    t.text     "image_url"
    t.integer  "width"
    t.integer  "height"
    t.datetime "taken_at"
    t.integer  "duration"
    t.text     "enclosure_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end