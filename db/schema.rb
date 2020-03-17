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

ActiveRecord::Schema.define(version: 2020_03_17_163241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "card_relationships", force: :cascade do |t|
    t.bigint "parent_card_id"
    t.bigint "child_card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_card_id", "parent_card_id"], name: "index_card_relationships_on_child_card_id_and_parent_card_id"
    t.index ["child_card_id"], name: "index_card_relationships_on_child_card_id"
    t.index ["parent_card_id", "child_card_id"], name: "index_card_relationships_on_parent_card_id_and_child_card_id"
    t.index ["parent_card_id"], name: "index_card_relationships_on_parent_card_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.string "text"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_id", null: false
    t.boolean "favorite"
    t.index ["campaign_id"], name: "index_cards_on_campaign_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "card_relationships", "cards", column: "child_card_id"
  add_foreign_key "card_relationships", "cards", column: "parent_card_id"
  add_foreign_key "cards", "campaigns"
  add_foreign_key "cards", "users"
end
