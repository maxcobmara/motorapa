class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :slug,              null: false
      t.string :manufacturer_id
      t.integer :site_category
      t.string :manufacturer_category
      t.string :model
      t.string :model_code
      t.string :url
      t.decimal :rrp, precision: 9, scale: 2
      t.string  :assembled_in
      t.integer :seat_height_mm
      t.integer :wheelbase_mm
      t.integer :length_mm
      t.integer :height_mm
      t.integer :width_mm
      t.integer :ground_clearance_mm
      t.string :engine_description
      t.integer :displacement
      t.decimal :max_power_ps
      t.integer :max_power_rpm
      t.decimal :max_torque_nm
      t.integer :max_torque_rpm
      t.integer :cylinders
      t.decimal :cyl_bore
      t.decimal :cyl_stroke
      t.integer :cyl_valves
      t.string :fuel
      t.decimal :fuel_capacity_l
      t.integer :consumption_lkm
      t.integer :range_km
      t.integer :drive_category
      t.string :transmission
      t.string :clutch
      t.integer :gears
      t.string :tyre_front
      t.string :tyre_rear
      t.boolean :tube
      t.string :tyre_category
      t.integer :wheel_front_in
      t.integer :wheel_rear_in
      t.integer :kerb_weight_kg
      t.string :brake_front_desc
      t.string :brake_rear_desc
      t.string :battery_size
      t.text :additional_features
      t.text :data

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
