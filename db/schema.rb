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

ActiveRecord::Schema.define(version: 2020_12_01_082435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "deals", force: :cascade do |t|
    t.boolean "sender_ok?", default: false
    t.boolean "receiver_ok?", default: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_deals_on_receiver_id"
    t.index ["sender_id"], name: "index_deals_on_sender_id"
  end

  create_table "disc_artists", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "disc_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_disc_artists_on_artist_id"
    t.index ["disc_id"], name: "index_disc_artists_on_disc_id"
  end

  create_table "disc_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "disc_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disc_id"], name: "index_disc_genres_on_disc_id"
    t.index ["genre_id"], name: "index_disc_genres_on_genre_id"
  end

  create_table "disc_states", force: :cascade do |t|
    t.string "name"
    t.float "coefficient"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "disc_styles", force: :cascade do |t|
    t.bigint "style_id", null: false
    t.bigint "disc_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disc_id"], name: "index_disc_styles_on_disc_id"
    t.index ["style_id"], name: "index_disc_styles_on_style_id"
  end

  create_table "disc_tracks", force: :cascade do |t|
    t.bigint "track_id", null: false
    t.bigint "disc_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disc_id"], name: "index_disc_tracks_on_disc_id"
    t.index ["track_id"], name: "index_disc_tracks_on_track_id"
  end

  create_table "discs", force: :cascade do |t|
    t.string "title"
    t.integer "release"
    t.string "code"
    t.integer "value"
    t.string "label"
    t.string "format"
    t.string "country"
    t.string "cover_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_libraries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "disc_id"
    t.text "description"
    t.bigint "disc_state_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disc_id"], name: "index_user_libraries_on_disc_id"
    t.index ["disc_state_id"], name: "index_user_libraries_on_disc_state_id"
    t.index ["user_id"], name: "index_user_libraries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "additional_address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.text "description"
    t.string "avatar"
    t.boolean "is_admin?", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "disc_artists", "artists"
  add_foreign_key "disc_artists", "discs"
  add_foreign_key "disc_genres", "discs"
  add_foreign_key "disc_genres", "genres"
  add_foreign_key "disc_styles", "discs"
  add_foreign_key "disc_styles", "styles"
  add_foreign_key "disc_tracks", "discs"
  add_foreign_key "disc_tracks", "tracks"
end
