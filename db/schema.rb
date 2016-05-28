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

ActiveRecord::Schema.define(version: 20160522233325) do

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "enrollment"
    t.string "tuition"
    t.string "acceptance_rate"
    t.string "location"
    t.string "setting"
    t.string "college_type"
    t.string "url"
    t.string "petersons_url"
  end

  create_table "user_colleges", force: :cascade do |t|
    t.integer "college_id"
    t.integer "user_id"
    t.string  "review"
    t.string  "my_notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
