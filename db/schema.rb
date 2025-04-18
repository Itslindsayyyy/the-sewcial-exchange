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

ActiveRecord::Schema[8.0].define(version: 2025_04_18_004651) do
  create_table "feedback_forms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "category"
    t.text "message"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedback_forms_on_user_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.integer "swap_group_id", null: false
    t.integer "user_id", null: false
    t.string "group_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swap_group_id"], name: "index_group_memberships_on_swap_group_id"
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "message"
    t.boolean "read"
    t.string "notification_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "swap_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_swap_groups_on_created_by_id"
  end

  create_table "swap_tasks", force: :cascade do |t|
    t.integer "swap_id", null: false
    t.string "task_name"
    t.date "due_date"
    t.integer "assigned_to_user_id", null: false
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_user_id"], name: "index_swap_tasks_on_assigned_to_user_id"
    t.index ["swap_id"], name: "index_swap_tasks_on_swap_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.integer "swap_group_id", null: false
    t.string "title"
    t.string "theme"
    t.datetime "deadline"
    t.string "status"
    t.text "rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swap_group_id"], name: "index_swaps_on_swap_group_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "user_swap_tasks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "swap_task_id", null: false
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swap_task_id"], name: "index_user_swap_tasks_on_swap_task_id"
    t.index ["user_id"], name: "index_user_swap_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "instagram_url"
    t.string "facebook_url"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "password_digest"
  end

  add_foreign_key "feedback_forms", "users"
  add_foreign_key "group_memberships", "swap_groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "swap_groups", "created_bies"
  add_foreign_key "swap_tasks", "assigned_to_users"
  add_foreign_key "swap_tasks", "swaps"
  add_foreign_key "swaps", "swap_groups"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_swap_tasks", "swap_tasks"
  add_foreign_key "user_swap_tasks", "users"
end
