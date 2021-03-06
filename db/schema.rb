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

ActiveRecord::Schema.define(version: 20160830133239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "operator_profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image"
    t.index ["operator_profile_id"], name: "index_images_on_operator_profile_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "operator_profiles", force: :cascade do |t|
    t.string   "company_name"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.index ["user_id"], name: "index_operator_profiles_on_user_id", using: :btree
  end

  create_table "operator_skills", force: :cascade do |t|
    t.integer  "operator_profile_id"
    t.integer  "skill_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["operator_profile_id"], name: "index_operator_skills_on_operator_profile_id", using: :btree
    t.index ["skill_id"], name: "index_operator_skills_on_skill_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.date     "date"
    t.string   "content"
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "request_id"
    t.integer  "price_cents", default: 0, null: false
    t.json     "payment"
    t.index ["request_id"], name: "index_proposals_on_request_id", using: :btree
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.date     "due_date"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "details"
    t.string   "category"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "status",     default: 0
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proposal_id"
    t.index ["proposal_id"], name: "index_reviews_on_proposal_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "address"
    t.boolean  "pilot"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "last_name"
    t.string   "first_name"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.integer  "operator_profile_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["operator_profile_id"], name: "index_videos_on_operator_profile_id", using: :btree
  end

  add_foreign_key "images", "operator_profiles"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "operator_profiles", "users"
  add_foreign_key "operator_skills", "operator_profiles"
  add_foreign_key "operator_skills", "skills"
  add_foreign_key "proposals", "requests"
  add_foreign_key "proposals", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "proposals"
  add_foreign_key "videos", "operator_profiles"
end
