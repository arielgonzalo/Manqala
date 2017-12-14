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

ActiveRecord::Schema.define(version: 20171209081422) do

  create_table "board_game_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.integer "backup_quantity"
    t.float "replacement_cost"
    t.integer "difficulty"
    t.integer "board_game_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["board_game_category_id"], name: "index_board_games_on_board_game_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_bar", default: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "pid"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "is_active"
    t.string "inactivation_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "product_id"
    t.integer "pass_id"
    t.integer "quantity"
    t.float "unit_price"
    t.float "unit_total_price"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
    t.index ["pass_id"], name: "index_invoice_lines_on_pass_id"
    t.index ["product_id"], name: "index_invoice_lines_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "client_id"
    t.integer "table_id"
    t.float "subtotal"
    t.float "taxes"
    t.float "service"
    t.float "total"
    t.date "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["table_id"], name: "index_invoices_on_table_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "table_id"
    t.integer "product_id"
    t.integer "pass_id"
    t.integer "quantity", default: 1
    t.integer "status"
    t.date "date_time"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "invoiced", default: false
    t.integer "billed", default: 0
    t.index ["pass_id"], name: "index_orders_on_pass_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "passes", force: :cascade do |t|
    t.date "start_time"
    t.date "end_time"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_passes_on_client_id"
  end

  create_table "product_tax_assigments", force: :cascade do |t|
    t.integer "food_id"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_product_tax_assigments_on_food_id"
    t.index ["tax_id"], name: "index_product_tax_assigments_on_tax_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "client_id"
    t.integer "board_game_id"
    t.date "start_time"
    t.date "end_time"
    t.integer "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_game_id"], name: "index_rentals_on_board_game_id"
    t.index ["client_id"], name: "index_rentals_on_client_id"
    t.index ["table_id"], name: "index_rentals_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.boolean "is_outdoor"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
