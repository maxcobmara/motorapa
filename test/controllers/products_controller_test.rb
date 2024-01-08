require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { additional_features: @product.additional_features, battery_size: @product.battery_size, brake_front_desc: @product.brake_front_desc, brake_rear_desc: @product.brake_rear_desc, clutch: @product.clutch, consumption_lkm: @product.consumption_lkm, cyl_bore: @product.cyl_bore, cyl_stroke: @product.cyl_stroke, cyl_valves: @product.cyl_valves, cylinders: @product.cylinders, data: @product.data, displacement: @product.displacement, drive_category: @product.drive_category, engine_description: @product.engine_description, fuel: @product.fuel, fuel_capacity_l: @product.fuel_capacity_l, gears: @product.gears, ground_clearance_mm: @product.ground_clearance_mm, height_mm: @product.height_mm, kerb_weight_kg: @product.kerb_weight_kg, length_mm: @product.length_mm, manufacturer: @product.manufacturer, max_power_ps: @product.max_power_ps, max_power_rpm: @product.max_power_rpm, max_torque_nm: @product.max_torque_nm, max_torque_rpm: @product.max_torque_rpm, model: @product.model, model_code: @product.model_code, range_km: @product.range_km, rrp: @product.rrp, seat_height_mm: @product.seat_height_mm, transmission: @product.transmission, tube: @product.tube, tyre_category: @product.tyre_category, tyre_front: @product.tyre_front, tyre_rear: @product.tyre_rear, url: @product.url, wheel_front_in: @product.wheel_front_in, wheel_rear_in: @product.wheel_rear_in, wheelbase_mm: @product.wheelbase_mm, width_mm: @product.width_mm } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { additional_features: @product.additional_features, battery_size: @product.battery_size, brake_front_desc: @product.brake_front_desc, brake_rear_desc: @product.brake_rear_desc, clutch: @product.clutch, consumption_lkm: @product.consumption_lkm, cyl_bore: @product.cyl_bore, cyl_stroke: @product.cyl_stroke, cyl_valves: @product.cyl_valves, cylinders: @product.cylinders, data: @product.data, displacement: @product.displacement, drive_category: @product.drive_category, engine_description: @product.engine_description, fuel: @product.fuel, fuel_capacity_l: @product.fuel_capacity_l, gears: @product.gears, ground_clearance_mm: @product.ground_clearance_mm, height_mm: @product.height_mm, kerb_weight_kg: @product.kerb_weight_kg, length_mm: @product.length_mm, manufacturer: @product.manufacturer, max_power_ps: @product.max_power_ps, max_power_rpm: @product.max_power_rpm, max_torque_nm: @product.max_torque_nm, max_torque_rpm: @product.max_torque_rpm, model: @product.model, model_code: @product.model_code, range_km: @product.range_km, rrp: @product.rrp, seat_height_mm: @product.seat_height_mm, transmission: @product.transmission, tube: @product.tube, tyre_category: @product.tyre_category, tyre_front: @product.tyre_front, tyre_rear: @product.tyre_rear, url: @product.url, wheel_front_in: @product.wheel_front_in, wheel_rear_in: @product.wheel_rear_in, wheelbase_mm: @product.wheelbase_mm, width_mm: @product.width_mm } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
