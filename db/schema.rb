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

ActiveRecord::Schema.define(version: 20150507024818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "functions", force: :cascade do |t|
    t.string   "Dominant"
    t.string   "Auxiliary"
    t.string   "Tertiary"
    t.string   "Inferior"
    t.integer  "personality_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "mb_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personalities", force: :cascade do |t|
    t.string   "MBPT"
    t.string   "image"
    t.text     "full_description"
    t.text     "short_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "catchphrase"
    t.string   "famous_people"
  end

  create_table "providers", force: :cascade do |t|
    t.string   "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "uid"
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "tweet"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.string   "email"
    t.string   "image"
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "link"
    t.string   "gender"
    t.string   "nickname"
    t.string   "location"
    t.string   "description"
    t.string   "status_count"
    t.json     "raw_data"
    t.float    "introversion"
    t.float    "extraversion"
    t.float    "intuition"
    t.float    "sensing"
    t.float    "thinking"
    t.float    "feeling"
    t.float    "judging"
    t.float    "perceiving"
    t.float    "negative_sentiment"
    t.float    "positive_sentiment"
    t.float    "topic_arts"
    t.float    "topic_business"
    t.float    "topic_computers"
    t.float    "topic_games"
    t.float    "topic_health"
    t.float    "topic_home"
    t.float    "topic_recreation"
    t.float    "topic_science"
    t.float    "topic_society"
    t.float    "topic_sports"
    t.float    "age_group1"
    t.float    "age_group2"
    t.float    "age_group3"
    t.float    "age_group4"
    t.float    "age_group5"
    t.float    "age_group6"
    t.integer  "personality_id"
  end

  add_index "users", ["personality_id"], name: "index_users_on_personality_id", using: :btree

end
