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

ActiveRecord::Schema.define(version: 20180312055727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.string "description"
    t.string "bug_type"
    t.date "deadline"
    t.string "screenshot"
    t.bigint "createdby_id"
    t.bigint "assignedto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignedto_id"], name: "index_bugs_on_assignedto_id"
    t.index ["createdby_id"], name: "index_bugs_on_createdby_id"
    t.index ["project_id"], name: "index_bugs_on_project_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "manager_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_projects_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bugs", "projects"
  add_foreign_key "bugs", "users", column: "assignedto_id"
  add_foreign_key "bugs", "users", column: "createdby_id"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects", "users", column: "manager_id"
end
