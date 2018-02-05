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

ActiveRecord::Schema.define(version: 20180204172339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "fortytwo_achievements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "tier"
    t.string "kind"
    t.boolean "visible"
    t.text "image"
    t.integer "nbr_of_success"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_fortytwo_achievements_on_parent_id"
  end

  create_table "fortytwo_achievements_users", force: :cascade do |t|
    t.bigint "achievement_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_fortytwo_achievements_users_on_achievement_id"
    t.index ["user_id"], name: "index_fortytwo_achievements_users_on_user_id"
  end

  create_table "fortytwo_apps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "secret"
  end

  create_table "fortytwo_campus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fortytwo_campus_users", force: :cascade do |t|
    t.bigint "campus_id"
    t.bigint "user_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_fortytwo_campus_users_on_campus_id"
    t.index ["user_id"], name: "index_fortytwo_campus_users_on_user_id"
  end

  create_table "fortytwo_coalitions", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "image_url"
    t.string "color"
    t.integer "score"
    t.bigint "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_fortytwo_coalitions_on_master_id"
  end

  create_table "fortytwo_coalitions_users", force: :cascade do |t|
    t.bigint "coalition_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coalition_id"], name: "index_fortytwo_coalitions_users_on_coalition_id"
    t.index ["user_id"], name: "index_fortytwo_coalitions_users_on_user_id"
  end

  create_table "fortytwo_cursus", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fortytwo_cursus_users", force: :cascade do |t|
    t.bigint "cursus_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade"
    t.integer "level"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean "has_coalition"
    t.index ["cursus_id"], name: "index_fortytwo_cursus_users_on_cursus_id"
    t.index ["user_id"], name: "index_fortytwo_cursus_users_on_user_id"
  end

  create_table "fortytwo_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fortytwo_groups_users", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_fortytwo_groups_users_on_group_id"
    t.index ["user_id"], name: "index_fortytwo_groups_users_on_user_id"
  end

  create_table "fortytwo_projects", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_fortytwo_projects_on_parent_id"
  end

  create_table "fortytwo_projects_users", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.integer "occurrence"
    t.integer "final_mark"
    t.string "status"
    t.boolean "validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_fortytwo_projects_users_on_project_id"
    t.index ["user_id"], name: "index_fortytwo_projects_users_on_user_id"
  end

  create_table "fortytwo_projects_users_cursus", force: :cascade do |t|
    t.bigint "projects_user_id"
    t.bigint "cursus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cursus_id"], name: "index_fortytwo_projects_users_cursus_on_cursus_id"
    t.index ["projects_user_id"], name: "index_fortytwo_projects_users_cursus_on_projects_user_id"
  end

  create_table "fortytwo_titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fortytwo_titles_users", force: :cascade do |t|
    t.bigint "title_id"
    t.bigint "user_id"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_fortytwo_titles_users_on_title_id"
    t.index ["user_id"], name: "index_fortytwo_titles_users_on_user_id"
  end

  create_table "fortytwo_users", force: :cascade do |t|
    t.string "email"
    t.string "login"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.text "image_url"
    t.boolean "staff"
    t.integer "correction_point"
    t.string "pool_month"
    t.string "pool_year"
    t.integer "wallet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends_groups", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_friends_groups_on_owner_id"
  end

  create_table "friends_groups_users", force: :cascade do |t|
    t.bigint "friends_group_id"
    t.bigint "friends_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friends_group_id"], name: "index_friends_groups_users_on_friends_group_id"
    t.index ["friends_user_id"], name: "index_friends_groups_users_on_friends_user_id"
  end

  create_table "friends_users", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_users_on_friend_id"
    t.index ["owner_id"], name: "index_friends_users_on_owner_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "linkable_type"
    t.bigint "linkable_id"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkable_type", "linkable_id"], name: "index_logs_on_linkable_type_and_linkable_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "app_id"
    t.integer "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_roles_on_app_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_tokens_on_app_id"
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  add_foreign_key "fortytwo_achievements", "fortytwo_achievements", column: "parent_id"
  add_foreign_key "fortytwo_achievements_users", "fortytwo_achievements", column: "achievement_id"
  add_foreign_key "fortytwo_achievements_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_campus_users", "fortytwo_campus", column: "campus_id"
  add_foreign_key "fortytwo_campus_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_coalitions", "fortytwo_users", column: "master_id"
  add_foreign_key "fortytwo_coalitions_users", "fortytwo_coalitions", column: "coalition_id"
  add_foreign_key "fortytwo_coalitions_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_cursus_users", "fortytwo_cursus", column: "cursus_id"
  add_foreign_key "fortytwo_cursus_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_groups_users", "fortytwo_groups", column: "group_id"
  add_foreign_key "fortytwo_groups_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_projects", "fortytwo_projects", column: "parent_id"
  add_foreign_key "fortytwo_projects_users", "fortytwo_projects", column: "project_id"
  add_foreign_key "fortytwo_projects_users", "fortytwo_users", column: "user_id"
  add_foreign_key "fortytwo_projects_users_cursus", "fortytwo_cursus", column: "cursus_id"
  add_foreign_key "fortytwo_projects_users_cursus", "fortytwo_projects_users", column: "projects_user_id"
  add_foreign_key "fortytwo_titles_users", "fortytwo_titles", column: "title_id"
  add_foreign_key "fortytwo_titles_users", "fortytwo_users", column: "user_id"
  add_foreign_key "friends_groups", "fortytwo_users", column: "owner_id"
  add_foreign_key "friends_groups_users", "friends_groups"
  add_foreign_key "friends_groups_users", "friends_users"
  add_foreign_key "friends_users", "fortytwo_users", column: "friend_id"
  add_foreign_key "friends_users", "fortytwo_users", column: "owner_id"
  add_foreign_key "roles", "fortytwo_apps", column: "app_id"
  add_foreign_key "tokens", "fortytwo_apps", column: "app_id"
  add_foreign_key "tokens", "fortytwo_users", column: "user_id"
end
