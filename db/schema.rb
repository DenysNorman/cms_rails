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

ActiveRecord::Schema.define(version: 20170427142545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.text     "body"
    t.string   "block_type"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_contents_on_page_id", using: :btree
  end

  create_table "descriptions", force: :cascade do |t|
    t.string   "body"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_descriptions_on_page_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "statuses"
    t.integer  "plan_id"
    t.integer  "league_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_invoices_on_league_id", using: :btree
    t.index ["plan_id"], name: "index_invoices_on_plan_id", using: :btree
    t.index ["team_id"], name: "index_invoices_on_team_id", using: :btree
    t.index ["user_id"], name: "index_invoices_on_user_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "content"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 5, scale: 2
    t.string   "version"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "team_images", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "actual_date"
    t.string   "vk_image"
    t.string   "flat_image"
    t.string   "logo_image"
    t.string   "preview_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id"], name: "index_team_images_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "body"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_titles_on_page_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "contents", "pages"
  add_foreign_key "descriptions", "pages"
  add_foreign_key "invoices", "leagues"
  add_foreign_key "invoices", "plans"
  add_foreign_key "invoices", "teams"
  add_foreign_key "invoices", "users"
  add_foreign_key "team_images", "teams"
  add_foreign_key "teams", "leagues"
  add_foreign_key "titles", "pages"
end
