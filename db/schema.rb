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

ActiveRecord::Schema.define(version: 20171023002131) do

  create_table "access_grantings", force: :cascade do |t|
    t.integer "client_id"
    t.integer "library_access_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_access_grantings_on_client_id"
    t.index ["library_access_id"], name: "index_access_grantings_on_library_access_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "is_active"
    t.string "inactivation_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_tax_assigments", force: :cascade do |t|
    t.integer "food_id"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_food_tax_assigments_on_food_id"
    t.index ["tax_id"], name: "index_food_tax_assigments_on_tax_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_details", force: :cascade do |t|
    t.integer "invoice_id"
    t.string "product"
    t.string "indications"
    t.integer "qt_ordered"
    t.integer "qt_served"
    t.float "unitary_price"
    t.float "total_tax"
    t.float "total_price"
    t.time "ordered_at"
    t.time "finalized_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_details_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.time "date_time"
    t.integer "client_id"
    t.float "amount"
    t.float "tax_amount"
    t.float "total_amount"
    t.integer "table_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "library_accesses", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "client_id"
    t.integer "table_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_rentals_on_client_id"
    t.index ["table_game_id"], name: "index_rentals_on_table_game_id"
  end

  create_table "table_game_tax_assigments", force: :cascade do |t|
    t.integer "table_game_id"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_game_id"], name: "index_table_game_tax_assigments_on_table_game_id"
    t.index ["tax_id"], name: "index_table_game_tax_assigments_on_tax_id"
  end

  create_table "table_games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "qt_in_use"
    t.integer "qt_in_bk"
    t.float "penalty_cost"
    t.string "serial"
    t.string "bin"
    t.integer "dificulty_level"
    t.boolean "outdoor_usable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
