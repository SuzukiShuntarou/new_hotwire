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

ActiveRecord::Schema[7.2].define(version: 2025_01_24_051835) do
  create_table "completes", force: :cascade do |t|
    t.text "content"
    t.integer "progress"
    t.integer "user_id", null: false
    t.integer "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_completes_on_reward_id"
    t.index ["user_id"], name: "index_completes_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.text "content"
    t.integer "progress"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "marks", force: :cascade do |t|
    t.text "content"
    t.integer "progress"
    t.integer "user_id", null: false
    t.integer "treat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treat_id"], name: "index_marks_on_treat_id"
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.date "completiondate"
    t.text "content"
    t.text "location"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "treats", force: :cascade do |t|
    t.date "completiondate"
    t.text "content"
    t.text "location"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_treats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "completes", "rewards"
  add_foreign_key "completes", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "marks", "treats"
  add_foreign_key "marks", "users"
  add_foreign_key "rewards", "users"
  add_foreign_key "treats", "users"
end
