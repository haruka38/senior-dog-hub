# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_11_101933) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_answers", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body", null: false
    t.string "nickname"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id"
    t.index ["breed_id"], name: "index_questions_on_breed_id"
  end

  create_table "stamp_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stamps", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stamp_type_id", null: false
    t.string "stampable_type", null: false
    t.bigint "stampable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "guest_id"
    t.index ["stamp_type_id"], name: "index_stamps_on_stamp_type_id"
    t.index ["stampable_type", "stampable_id"], name: "index_stamps_on_stampable"
    t.index ["user_id"], name: "index_stamps_on_user_id"
  end

  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "breeds"
  add_foreign_key "stamps", "stamp_types"
end
