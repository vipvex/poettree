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

ActiveRecord::Schema.define(version: 20180411230210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lesson_completeds", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_completeds_on_lesson_id"
    t.index ["user_id"], name: "index_lesson_completeds_on_user_id"
  end

  create_table "lesson_groups", force: :cascade do |t|
    t.string "title"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "order"
    t.string "lesson_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lesson_group_id"
    t.string "video_link"
    t.index ["lesson_group_id"], name: "index_lessons_on_lesson_group_id"
  end

  create_table "poems", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id"
    t.string "image_url"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_poems_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "provider"
    t.string "uid"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "lesson_completeds", "lessons"
  add_foreign_key "lesson_completeds", "users"
  add_foreign_key "lessons", "lesson_groups"
  add_foreign_key "poems", "users"
end
