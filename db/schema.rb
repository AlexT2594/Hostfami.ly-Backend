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

ActiveRecord::Schema.define(version: 20170513133542) do

  create_table "family_abouts", force: :cascade do |t|
    t.integer  "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_family_abouts_on_family_id"
  end

  create_table "student_about_mes", force: :cascade do |t|
    t.integer  "student_id"
    t.date     "birthday"
    t.string   "birthday_country"
    t.string   "country_living"
    t.string   "gender"
    t.integer  "religion_celebrations"
    t.boolean  "same_religion_hosting"
    t.integer  "height"
    t.integer  "weight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["student_id"], name: "index_student_about_mes_on_student_id"
  end

  create_table "student_educational_backgrounds", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_educational_backgrounds_on_student_id"
  end

  create_table "student_health_lifestyles", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_health_lifestyles_on_student_id"
  end

  create_table "student_my_descriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_my_descriptions_on_student_id"
  end

  create_table "student_passport_infos", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "tel"
    t.string   "cell"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "volunteer_about_mes", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["volunteer_id"], name: "index_volunteer_about_mes_on_volunteer_id"
  end

end
