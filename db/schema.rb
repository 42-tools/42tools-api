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

ActiveRecord::Schema.define(version: 20171121233534) do

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps_tokens", force: :cascade do |t|
    t.integer "app_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_apps_tokens_on_app_id"
    t.index ["user_id"], name: "index_apps_tokens_on_user_id"
  end

  create_table "campus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campus_users", force: :cascade do |t|
    t.integer "campus_id"
    t.integer "user_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_campus_users_on_campus_id"
    t.index ["user_id"], name: "index_campus_users_on_user_id"
  end

  create_table "coalitions", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "image_url"
    t.string "color"
    t.integer "score"
    t.integer "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_coalitions_on_master_id"
  end

  create_table "coalitions_users", force: :cascade do |t|
    t.integer "coalition_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coalition_id"], name: "index_coalitions_users_on_coalition_id"
    t.index ["user_id"], name: "index_coalitions_users_on_user_id"
  end

  create_table "cursus", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursus_users", force: :cascade do |t|
    t.integer "cursus_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cursus_id"], name: "index_cursus_users_on_cursus_id"
    t.index ["user_id"], name: "index_cursus_users_on_user_id"
  end

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

  create_table "friends_groups", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_friends_groups_on_owner_id"
  end

  create_table "friends_groups_users", force: :cascade do |t|
    t.integer "friends_group_id"
    t.integer "friends_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friends_group_id"], name: "index_friends_groups_users_on_friends_group_id"
    t.index ["friends_user_id"], name: "index_friends_groups_users_on_friends_user_id"
  end

  create_table "friends_users", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_users_on_friend_id"
    t.index ["owner_id"], name: "index_friends_users_on_owner_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "linkable_type"
    t.integer "linkable_id"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkable_type", "linkable_id"], name: "index_logs_on_linkable_type_and_linkable_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_projects_on_parent_id"
  end

  create_table "projects_users", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "occurrence"
    t.integer "final_mark"
    t.string "status"
    t.boolean "validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "projects_users_cursus", force: :cascade do |t|
    t.integer "projects_user_id"
    t.integer "cursus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cursus_id"], name: "index_projects_users_cursus_on_cursus_id"
    t.index ["projects_user_id"], name: "index_projects_users_cursus_on_projects_user_id"
  end

  create_table "users", force: :cascade do |t|
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

end
