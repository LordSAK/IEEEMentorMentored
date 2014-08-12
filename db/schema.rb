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

ActiveRecord::Schema.define(version: 20140812065417) do

  create_table "availabilities", force: true do |t|
    t.integer  "UserID"
    t.string   "UserDays"
    t.string   "TimeFrom"
    t.string   "TimeTo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["UserID", "created_at"], name: "index_availabilities_on_UserID_and_created_at"

  create_table "communications", force: true do |t|
    t.integer  "UserID"
    t.string   "CommunicationMode"
    t.string   "CommunicationDetail"
    t.string   "Private"
    t.string   "Preferred"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.string   "days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.integer  "UserID",     limit: 255
    t.string   "SchoolName"
    t.string   "SchoolFrom"
    t.string   "SchoolTo"
    t.string   "Private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_users", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "approval"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "privacy"
  end

  create_table "interests", force: true do |t|
    t.string   "InterestArea"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intern_users", force: true do |t|
    t.string   "resume_path"
    t.integer  "internship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ApplicantID"
  end

  create_table "internships", force: true do |t|
    t.string   "Title"
    t.string   "Description"
    t.string   "Location"
    t.integer  "CompanyID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentoring_partnerships", force: true do |t|
    t.string   "Partnership"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.integer  "UserID",      limit: 255
    t.string   "Designation"
    t.string   "Company"
    t.string   "Job_From"
    t.string   "Job_To"
    t.string   "Private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.string   "IEEESocieties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userrequests", force: true do |t|
    t.integer  "RequestFrom", limit: 255
    t.integer  "RequestTo",   limit: 255
    t.string   "IsApproved"
    t.string   "SkillType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "First_Name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "Last_Name"
    t.string   "user_Type"
    t.string   "SkillType"
    t.string   "user_Need"
    t.string   "user_City"
    t.string   "user_State"
    t.string   "user_Zip"
    t.string   "SkillType1"
    t.string   "SkillNeed1"
    t.string   "SkillType2"
    t.string   "skillNeed2"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "interest"
    t.string   "societies"
    t.string   "sector"
    t.string   "partnership"
    t.string   "CompanyName"
    t.string   "AlternateName"
    t.string   "Selector"
    t.string   "From"
    t.string   "To"
    t.string   "Account"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "work_sectors", force: true do |t|
    t.string   "Sector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
