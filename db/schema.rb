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

ActiveRecord::Schema.define(version: 20150515052110) do

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

  create_table "user_providers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.string   "email"
    t.string   "image"
    t.string   "name"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "link"
    t.string   "gender"
    t.string   "nickname"
    t.string   "location"
    t.string   "description"
    t.string   "status_count"
    t.json     "raw_data"
    t.decimal  "introversion",       precision: 5, scale: 2
    t.decimal  "extraversion",       precision: 5, scale: 2
    t.decimal  "intuition",          precision: 5, scale: 2
    t.decimal  "sensing",            precision: 5, scale: 2
    t.decimal  "thinking",           precision: 5, scale: 2
    t.decimal  "feeling",            precision: 5, scale: 2
    t.decimal  "judging",            precision: 5, scale: 2
    t.decimal  "perceiving",         precision: 5, scale: 2
    t.decimal  "negative_sentiment", precision: 5, scale: 2
    t.decimal  "positive_sentiment", precision: 5, scale: 2
    t.decimal  "topic_arts",         precision: 5, scale: 2
    t.decimal  "topic_business",     precision: 5, scale: 2
    t.decimal  "topic_computers",    precision: 5, scale: 2
    t.decimal  "topic_games",        precision: 5, scale: 2
    t.decimal  "topic_health",       precision: 5, scale: 2
    t.decimal  "topic_home",         precision: 5, scale: 2
    t.decimal  "topic_recreation",   precision: 5, scale: 2
    t.decimal  "topic_science",      precision: 5, scale: 2
    t.decimal  "topic_society",      precision: 5, scale: 2
    t.decimal  "topic_sports",       precision: 5, scale: 2
    t.decimal  "age_group1",         precision: 5, scale: 2
    t.decimal  "age_group2",         precision: 5, scale: 2
    t.decimal  "age_group3",         precision: 5, scale: 2
    t.decimal  "age_group4",         precision: 5, scale: 2
    t.decimal  "age_group5",         precision: 5, scale: 2
    t.decimal  "age_group6",         precision: 5, scale: 2
    t.integer  "personality_id"
    t.string   "uid"
  end

  add_index "users", ["personality_id"], name: "index_users_on_personality_id", using: :btree

end
