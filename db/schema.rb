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

ActiveRecord::Schema[7.0].define(version: 2024_09_02_061036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name"
    t.string "website"
    t.string "country"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_manufacturers_on_slug", unique: true
  end

  create_table "media", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.string "url"
    t.string "url_source"
    t.string "publisher"
    t.date "published_on"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_media_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "manufacturer_id"
    t.string "category"
    t.string "manufacturer_category"
    t.string "model"
    t.string "model_code"
    t.decimal "rrp", precision: 9, scale: 2
    t.string "assembled_in"
    t.integer "seat_height_mm"
    t.integer "wheelbase_mm"
    t.integer "length_mm"
    t.integer "height_mm"
    t.integer "width_mm"
    t.integer "ground_clearance_mm"
    t.string "engine_description"
    t.decimal "displacement", precision: 5, scale: 1
    t.integer "topspeed_km"
    t.decimal "max_power_ps"
    t.integer "max_power_rpm"
    t.decimal "max_torque_nm"
    t.integer "max_torque_rpm"
    t.integer "cylinders"
    t.decimal "cyl_bore"
    t.decimal "cyl_stroke"
    t.integer "cyl_valves"
    t.decimal "oil_capacity_l", precision: 5, scale: 2
    t.string "fuel"
    t.decimal "fuel_capacity_l", precision: 5, scale: 2
    t.decimal "consumption_lkm", precision: 5, scale: 2
    t.integer "range_km"
    t.string "drive_category"
    t.string "transmission"
    t.string "clutch"
    t.integer "gears"
    t.string "tyre_front"
    t.string "tyre_rear"
    t.boolean "tube"
    t.string "tyre_category"
    t.integer "wheel_front_in"
    t.integer "wheel_rear_in"
    t.string "suspension_front"
    t.string "suspension_rear"
    t.integer "kerb_weight_kg"
    t.string "brake_front_desc"
    t.string "brake_rear_desc"
    t.string "battery_size"
    t.text "additional_features"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "retired_on"
    t.date "launched_on"
    t.integer "created_by"
    t.integer "updated_by"
    t.string "cooling"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.string "display_name"
    t.text "user_data"
    t.text "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "media", "products"
end
