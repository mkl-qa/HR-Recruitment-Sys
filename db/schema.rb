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

ActiveRecord::Schema.define(version: 20140912030837) do

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

  create_table "requisitions", force: true do |t|
    t.string   "Req_ID"
    t.string   "Req_NO"
    t.string   "Position_title"
    t.string   "priority"
    t.string   "job_category"
    t.string   "OG"
    t.string   "Position_Level"
    t.string   "Location"
    t.integer  "Openings"
    t.string   "Account_information"
    t.string   "hiring_mgr"
    t.date     "job_posting_date"
    t.string   "approved_in_RMO_or_Not"
    t.date     "RMO_Open_Date"
    t.date     "preferred_onboard_date"
    t.string   "Biz_impact_details"
    t.string   "key_words"
    t.string   "cahnnel"
    t.string   "status"
    t.string   "open_to_candidate"
    t.string   "job_description"
    t.string   "desired_skills_and_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
