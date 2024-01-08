require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Additional features", with: @product.additional_features
    fill_in "Battery size", with: @product.battery_size
    fill_in "Brake front desc", with: @product.brake_front_desc
    fill_in "Brake rear desc", with: @product.brake_rear_desc
    fill_in "Clutch", with: @product.clutch
    fill_in "Consumption lkm", with: @product.consumption_lkm
    fill_in "Cyl bore", with: @product.cyl_bore
    fill_in "Cyl stroke", with: @product.cyl_stroke
    fill_in "Cyl valves", with: @product.cyl_valves
    fill_in "Cylinders", with: @product.cylinders
    fill_in "Data", with: @product.data
    fill_in "Displacement", with: @product.displacement
    fill_in "Drive category", with: @product.drive_category
    fill_in "Engine description", with: @product.engine_description
    fill_in "Fuel", with: @product.fuel
    fill_in "Fuel capacity l", with: @product.fuel_capacity_l
    fill_in "Gears", with: @product.gears
    fill_in "Ground clearance mm", with: @product.ground_clearance_mm
    fill_in "Height mm", with: @product.height_mm
    fill_in "Kerb weight kg", with: @product.kerb_weight_kg
    fill_in "Length mm", with: @product.length_mm
    fill_in "Manufacturer", with: @product.manufacturer
    fill_in "Max power ps", with: @product.max_power_ps
    fill_in "Max power rpm", with: @product.max_power_rpm
    fill_in "Max torque nm", with: @product.max_torque_nm
    fill_in "Max torque rpm", with: @product.max_torque_rpm
    fill_in "Model", with: @product.model
    fill_in "Model code", with: @product.model_code
    fill_in "Range km", with: @product.range_km
    fill_in "Rrp", with: @product.rrp
    fill_in "Seat height mm", with: @product.seat_height_mm
    fill_in "Transmission", with: @product.transmission
    check "Tube" if @product.tube
    fill_in "Tyre category", with: @product.tyre_category
    fill_in "Tyre front", with: @product.tyre_front
    fill_in "Tyre rear", with: @product.tyre_rear
    fill_in "Url", with: @product.url
    fill_in "Wheel front in", with: @product.wheel_front_in
    fill_in "Wheel rear in", with: @product.wheel_rear_in
    fill_in "Wheelbase mm", with: @product.wheelbase_mm
    fill_in "Width mm", with: @product.width_mm
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Additional features", with: @product.additional_features
    fill_in "Battery size", with: @product.battery_size
    fill_in "Brake front desc", with: @product.brake_front_desc
    fill_in "Brake rear desc", with: @product.brake_rear_desc
    fill_in "Clutch", with: @product.clutch
    fill_in "Consumption lkm", with: @product.consumption_lkm
    fill_in "Cyl bore", with: @product.cyl_bore
    fill_in "Cyl stroke", with: @product.cyl_stroke
    fill_in "Cyl valves", with: @product.cyl_valves
    fill_in "Cylinders", with: @product.cylinders
    fill_in "Data", with: @product.data
    fill_in "Displacement", with: @product.displacement
    fill_in "Drive category", with: @product.drive_category
    fill_in "Engine description", with: @product.engine_description
    fill_in "Fuel", with: @product.fuel
    fill_in "Fuel capacity l", with: @product.fuel_capacity_l
    fill_in "Gears", with: @product.gears
    fill_in "Ground clearance mm", with: @product.ground_clearance_mm
    fill_in "Height mm", with: @product.height_mm
    fill_in "Kerb weight kg", with: @product.kerb_weight_kg
    fill_in "Length mm", with: @product.length_mm
    fill_in "Manufacturer", with: @product.manufacturer
    fill_in "Max power ps", with: @product.max_power_ps
    fill_in "Max power rpm", with: @product.max_power_rpm
    fill_in "Max torque nm", with: @product.max_torque_nm
    fill_in "Max torque rpm", with: @product.max_torque_rpm
    fill_in "Model", with: @product.model
    fill_in "Model code", with: @product.model_code
    fill_in "Range km", with: @product.range_km
    fill_in "Rrp", with: @product.rrp
    fill_in "Seat height mm", with: @product.seat_height_mm
    fill_in "Transmission", with: @product.transmission
    check "Tube" if @product.tube
    fill_in "Tyre category", with: @product.tyre_category
    fill_in "Tyre front", with: @product.tyre_front
    fill_in "Tyre rear", with: @product.tyre_rear
    fill_in "Url", with: @product.url
    fill_in "Wheel front in", with: @product.wheel_front_in
    fill_in "Wheel rear in", with: @product.wheel_rear_in
    fill_in "Wheelbase mm", with: @product.wheelbase_mm
    fill_in "Width mm", with: @product.width_mm
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
