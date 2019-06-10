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

ActiveRecord::Schema.define(version: 2019_06_08_214932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.text "description"
    t.string "url"
    t.index ["category_id"], name: "index_bookmarks_on_category_id"
    t.index ["creator_id"], name: "index_bookmarks_on_creator_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "priority"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.string "repeating_interval"
    t.string "week_days"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.string "file"
    t.string "folder"
    t.index ["category_id"], name: "index_files_on_category_id"
    t.index ["creator_id"], name: "index_files_on_creator_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.index ["category_id"], name: "index_galleries_on_category_id"
    t.index ["creator_id"], name: "index_galleries_on_creator_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.index ["category_id"], name: "index_ideas_on_category_id"
    t.index ["creator_id"], name: "index_ideas_on_creator_id"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.string "name"
    t.string "description"
    t.string "file"
    t.bigint "gallery_id"
    t.index ["creator_id"], name: "index_images_on_creator_id"
    t.index ["gallery_id"], name: "index_images_on_gallery_id"
  end

  create_table "notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.index ["category_id"], name: "index_notes_on_category_id"
    t.index ["creator_id"], name: "index_notes_on_creator_id"
  end

  create_table "todos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.string "name"
    t.text "description"
    t.date "deadline"
    t.boolean "done"
    t.integer "priority"
    t.index ["category_id"], name: "index_todos_on_category_id"
    t.index ["creator_id"], name: "index_todos_on_creator_id"
  end

  create_table "user_category_mappings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "category_id"
    t.boolean "selected"
    t.index ["category_id"], name: "index_user_category_mappings_on_category_id"
    t.index ["user_id"], name: "index_user_category_mappings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

end
