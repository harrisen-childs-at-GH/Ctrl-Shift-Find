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

ActiveRecord::Schema[7.0].define(version: 2023_09_26_051801) do
  create_table "ai_gpt_model_requests", force: :cascade do |t|
    t.integer "status"
    t.string "prompt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_file_id"
    t.index ["user_file_id"], name: "index_ai_gpt_model_requests_on_user_file_id"
  end

  create_table "ai_gpt_model_responses", force: :cascade do |t|
    t.string "payload"
    t.integer "request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_ai_gpt_model_responses_on_request_id"
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.string "version_control_url"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_repos_on_user_id"
  end

  create_table "user_files", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.integer "programming_language"
    t.integer "repo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repo_id"], name: "index_user_files_on_repo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ai_gpt_model_requests", "user_files"
  add_foreign_key "ai_gpt_model_responses", "ai_gpt_model_requests", column: "request_id"
  add_foreign_key "repos", "users"
  add_foreign_key "user_files", "repos"
end
