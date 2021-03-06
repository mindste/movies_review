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

ActiveRecord::Schema.define(version: 20170823033147) do

  create_table "buyers", force: :cascade do |t|
    t.string   "status",     default: "pending"
    t.string   "uuid"
    t.string   "name"
    t.string   "email"
    t.string   "cellphone"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.text     "bio"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["movie_id"], name: "index_buyers_on_movie_id"
    t.index ["ticket_id"], name: "index_buyers_on_ticket_id"
    t.index ["user_id"], name: "index_buyers_on_user_id"
    t.index ["uuid"], name: "index_buyers_on_uuid", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_attachments", force: :cascade do |t|
    t.integer  "movie_id"
    t.string   "attachment"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["movie_id"], name: "index_movie_attachments_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "movie_length"
    t.string   "director"
    t.string   "rating"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "is_hidden",          default: true
    t.string   "status",             default: "hidden"
    t.integer  "row_order"
    t.string   "friendly_id"
    t.index ["friendly_id"], name: "index_movies_on_friendly_id", unique: true
    t.index ["row_order"], name: "index_movies_on_row_order"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "movie_id"
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["movie_id"], name: "index_tickets_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
