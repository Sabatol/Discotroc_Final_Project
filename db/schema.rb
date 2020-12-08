# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_07_104753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "comment_sender_id"
    t.bigint "comment_receiver_id"
    t.bigint "deal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_receiver_id"], name: "index_comments_on_comment_receiver_id"
    t.index ["comment_sender_id"], name: "index_comments_on_comment_sender_id"
    t.index ["deal_id"], name: "index_comments_on_deal_id"
  end

  create_table "deal_contents", force: :cascade do |t|
    t.bigint "deal_id"
    t.bigint "sender_library_id"
    t.bigint "receiver_library_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deal_id"], name: "index_deal_contents_on_deal_id"
    t.index ["receiver_library_id"], name: "index_deal_contents_on_receiver_library_id"
    t.index ["sender_library_id"], name: "index_deal_contents_on_sender_library_id"
  end

  create_table "deal_pms", force: :cascade do |t|
    t.bigint "deal_id"
    t.bigint "pm_author_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deal_id"], name: "index_deal_pms_on_deal_id"
    t.index ["pm_author_id"], name: "index_deal_pms_on_pm_author_id"
  end

  create_table "deals", force: :cascade do |t|
    t.boolean "sender_ok", default: false
    t.boolean "receiver_ok", default: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_deals_on_receiver_id"
    t.index ["sender_id"], name: "index_deals_on_sender_id"
  end

