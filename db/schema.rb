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

ActiveRecord::Schema[7.1].define(version: 2024_02_29_004204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fridge_items", force: :cascade do |t|
    t.string "item_name"
    t.decimal "item_quantity"
    t.string "expiration_date"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "grocery_name"
    t.decimal "initial_quantity"
    t.decimal "disposed_quantity"
    t.boolean "dismissed", default: false
    t.integer "grocery_id"
    t.index ["grocery_id"], name: "index_fridge_items_on_grocery_id"
    t.index ["user_id"], name: "index_fridge_items_on_user_id"
  end

  create_table "groceries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_groceries_on_user_id"
  end

  create_table "grocery_taggings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grocery_id"
    t.integer "tag_id"
    t.index ["grocery_id", "tag_id"], name: "index_grocery_taggings_on_grocery_id_and_tag_id"
    t.index ["tag_id", "grocery_id"], name: "index_grocery_taggings_on_tag_id_and_grocery_id"
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.string "name"
    t.decimal "quantity"
    t.string "creator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked", default: false
    t.boolean "dismissed", default: false
    t.integer "fridge_item_id"
    t.integer "user_id"
    t.index ["fridge_item_id"], name: "index_shopping_list_items_on_fridge_item_id"
    t.index ["user_id"], name: "index_shopping_list_items_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.integer "user_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
