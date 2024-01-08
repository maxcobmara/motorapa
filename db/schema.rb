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

ActiveRecord::Schema[7.0].define(version: 2024_01_08_021533) do
  create_table "manufacturers", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name"
    t.string "website"
    t.string "country"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "slug", null: false
    t.string "manufacturer"
    t.string "model"
    t.string "model_code"
    t.string "url"
    t.decimal "rrp"
    t.string "assembled_in"
    t.integer "seat_height_mm"
    t.integer "wheelbase_mm"
    t.integer "length_mm"
    t.integer "height_mm"
    t.integer "width_mm"
    t.integer "ground_clearance_mm"
    t.string "engine_description"
    t.integer "displacement"
    t.decimal "max_power_ps"
    t.integer "max_power_rpm"
    t.decimal "max_torque_nm"
    t.integer "max_torque_rpm"
    t.integer "cylinders"
    t.decimal "cyl_bore"
    t.decimal "cyl_stroke"
    t.integer "cyl_valves"
    t.string "fuel"
    t.decimal "fuel_capacity_l"
    t.integer "consumption_lkm"
    t.integer "range_km"
    t.integer "drive_category"
    t.string "transmission"
    t.string "clutch"
    t.integer "gears"
    t.string "tyre_front"
    t.string "tyre_rear"
    t.boolean "tube"
    t.string "tyre_category"
    t.integer "wheel_front_in"
    t.integer "wheel_rear_in"
    t.integer "kerb_weight_kg"
    t.string "brake_front_desc"
    t.string "brake_rear_desc"
    t.string "battery_size"
    t.text "additional_features"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
