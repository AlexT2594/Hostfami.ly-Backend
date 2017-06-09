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

ActiveRecord::Schema.define(version: 20170608195600) do

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.binary   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "student_about_mes", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "tell"
    t.integer  "cell"
    t.string   "religion"
    t.string   "tutor_email"
    t.integer  "religion_celebrations"
    t.integer  "height"
    t.integer  "weight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["student_id"], name: "index_student_about_mes_on_student_id"
  end

  create_table "student_educational_backgrounds", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "school"
    t.date     "from"
    t.date     "to"
    t.string   "description"
    t.boolean  "graduated"
    t.string   "mother_language"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["student_id"], name: "index_student_educational_backgrounds_on_student_id"
  end

  create_table "student_health_lifestyles", force: :cascade do |t|
    t.integer  "student_id"
    t.boolean  "allergies"
    t.boolean  "handicaps"
    t.boolean  "pets"
    t.boolean  "diet"
    t.boolean  "smoking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_health_lifestyles_on_student_id"
  end

  create_table "student_my_descriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["student_id"], name: "index_student_my_descriptions_on_student_id"
  end

  create_table "student_passport_infos", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "number"
    t.date     "release"
    t.date     "expiration"
    t.string   "birth_country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["student_id"], name: "index_student_passport_infos_on_student_id"
  end

  create_table "student_program_preferences", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_program_preferences_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "birthday"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "password_digest"
    t.string   "gender"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["confirm_token"], name: "index_users_on_confirm_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "volunteer_about_mes", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["volunteer_id"], name: "index_volunteer_about_mes_on_volunteer_id"
  end

end
