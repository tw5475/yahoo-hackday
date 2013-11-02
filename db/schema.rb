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

ActiveRecord::Schema.define(version: 20131031083607) do

  create_table "places", force: true do |t|
    t.string   "p_name"
    t.string   "upid"
    t.string   "code_name"
    t.float    "lat"
    t.float    "lng"
    t.text     "info_desc"
    t.string   "info_source"
    t.string   "info_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "flickr_pics"
  end

  create_table "qa_sets", force: true do |t|
    t.integer "place_id"
    t.text    "question"
    t.string  "answer_correct"
    t.string  "answer_wrong_1"
    t.string  "answer_wrong_2"
  end

  create_table "user_places", force: true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.integer  "vs_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "u_name"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
