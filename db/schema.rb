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

ActiveRecord::Schema.define(version: 20140905061000) do

  create_table "data_dictionaries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_code"
    t.integer  "del_flg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_positions", force: true do |t|
    t.string   "title"
    t.string   "dept"
    t.integer  "opennum"
    t.text     "description"
    t.text     "requirement"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_positions", ["user_id", "created_at"], name: "index_job_positions_on_user_id_and_created_at"

  create_table "jobapps", force: true do |t|
    t.string   "title"
    t.string   "dept"
    t.integer  "num"
    t.text     "description"
    t.text     "requirement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merkle_users", force: true do |t|
    t.string   "user_name"
    t.string   "user_psd"
    t.string   "eng_name"
    t.string   "chn_name"
    t.string   "email"
    t.string   "bu"
    t.string   "location"
    t.string   "mgr"
    t.string   "position_title"
    t.string   "user_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "jobapp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["jobapp_id"], name: "index_relationships_on_jobapp_id"
  add_index "relationships", ["user_id", "jobapp_id"], name: "index_relationships_on_user_id_and_jobapp_id", unique: true
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "recruiter",       default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
