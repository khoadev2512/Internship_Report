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

ActiveRecord::Schema[7.1].define(version: 2023_11_16_064708) do
  create_table "assemblies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assemblies_parts", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "assembly_id"
    t.bigint "part_id"
    t.index ["assembly_id"], name: "index_assemblies_parts_on_assembly_id"
    t.index ["part_id"], name: "index_assemblies_parts_on_part_id"
  end

  create_table "books", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id", limit: 45
  end

  create_table "customers", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "has_bought"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distributors", charset: "utf8mb3", force: :cascade do |t|
    t.string "zipcode"
  end

  create_table "parts", charset: "utf8mb3", force: :cascade do |t|
    t.string "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id", limit: 45
    t.index ["name"], name: "index_products_on_name", unique: true
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "fullname"
    t.string "generation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adrress"
    t.bigint "customers_id"
    t.string "address"
    t.boolean "active"
    t.integer "age"
    t.index ["customers_id"], name: "index_users_on_customers_id"
    t.index ["fullname"], name: "index_users_on_fullname"
  end

  create_table "vehicles", charset: "utf8mb3", force: :cascade do |t|
    t.string "type"
    t.string "color"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "users", "customers", column: "customers_id"
end
