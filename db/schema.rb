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

ActiveRecord::Schema.define(version: 2021_05_06_092027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.bigint "package_id"
    t.string "customer_full_name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.integer "quantity", default: 1, null: false
    t.decimal "total_price", default: "0.0"
    t.string "payment_status", default: "Pending"
    t.decimal "partial_paid_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_books_on_package_id"
  end

  create_table "company_informations", force: :cascade do |t|
    t.string "company_name"
    t.text "about_us"
    t.string "mission"
    t.string "vision"
    t.string "facebook_link"
    t.string "tiktok_link"
    t.string "instagram_link"
    t.string "youtube_link"
    t.string "telegram_link"
    t.string "whatsapp_link"
    t.string "address"
    t.string "alternative_address"
    t.string "phone_number"
    t.string "alternative_phone_number"
    t.string "email"
    t.string "map_embed_link"
    t.string "why_choose_us"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.string "comment_type"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "destination_name"
    t.text "destination_description"
    t.string "country"
    t.string "city"
    t.string "map_embed_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_checklists", force: :cascade do |t|
    t.bigint "package_id"
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_package_checklists_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.bigint "tour_id"
    t.string "package_title", null: false
    t.string "package_description"
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_packages_on_tour_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "partner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "post_title"
    t.string "post_type"
    t.text "body"
    t.string "author_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.text "service_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.bigint "destination_id"
    t.string "tour_title"
    t.string "desciption"
    t.string "tour_duration"
    t.text "itinerary"
    t.text "other_essential_info"
    t.string "map"
    t.boolean "tour_avaliblity_status", default: true
    t.string "tour_display_on_homepage_priority", default: "low"
    t.string "tour_price_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tour_short_video"
    t.index ["destination_id"], name: "index_tours_on_destination_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
