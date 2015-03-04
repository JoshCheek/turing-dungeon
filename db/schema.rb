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

ActiveRecord::Schema.define(version: 20150304212149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "point_increments", force: :cascade do |t|
    t.integer  "value"
    t.text     "comment"
    t.integer  "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "point_increments", ["point_id"], name: "index_point_increments_on_point_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.integer  "total"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "provider"
    t.text     "uid"
    t.text     "avatar"
    t.text     "token"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree

  add_foreign_key "point_increments", "points"
  add_foreign_key "points", "users"
  add_foreign_key "users", "cohorts"
end
