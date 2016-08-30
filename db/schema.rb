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

ActiveRecord::Schema.define(version: 20160829202756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backlogs", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",                 null: false
    t.index ["name"], name: "index_backlogs_on_name", using: :btree
    t.index ["user_id"], name: "index_backlogs_on_user_id", using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "backlog_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["backlog_id"], name: "index_scores_on_backlog_id", using: :btree
    t.index ["story_id"], name: "index_scores_on_story_id", using: :btree
    t.index ["user_id"], name: "index_scores_on_user_id", using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "description", default: "", null: false
    t.integer  "backlog_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["backlog_id"], name: "index_stories_on_backlog_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",  default: "", null: false
    t.string   "email",      default: "", null: false
    t.string   "kind",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "scores", "backlogs"
  add_foreign_key "scores", "stories"
  add_foreign_key "scores", "users"
  add_foreign_key "stories", "backlogs"
end
