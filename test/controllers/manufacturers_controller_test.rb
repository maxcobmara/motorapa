require "test_helper"

class ManufacturersControllerTest < AuthenticatedIntegrationTest
  setup do
    @manufacturer = manufacturers(:acme)
  end

  test "should get index" do
    get manufacturers_url
    assert_response :success
  end

  test "should get admin new" do
    get new_admin_manufacturer_url
    assert_response :success
  end

  test "should not get new" do
    get "/manufacturers/new"
    assert_response :not_found
  end


  test "should create manufacturer" do
    assert_difference("Manufacturer.count") do
      post admin_manufacturers_url, params: { manufacturer: { country: @manufacturer.country, data: @manufacturer.data, name: @manufacturer.name, website: @manufacturer.website } }
    end

    assert_redirected_to admin_manufacturer_url(Manufacturer.last)
  end

  test "should show manufacturer" do
    get manufacturer_url(@manufacturer)
    assert_response :success
  end

  test "should not get edit" do
    get "/manufacturers/#{@manufacturer.id}/edit"
    assert_response :not_found
  end

  test "should get edit" do
    get edit_admin_manufacturer_url(@manufacturer)
    assert_response :success
  end

  test "should not update manufacturer" do
    patch manufacturer_url(@manufacturer), params: { manufacturer: { country: @manufacturer.country, data: @manufacturer.data, name: @manufacturer.name, website: @manufacturer.website } }
    assert_response :not_found
  end

  test "should update manufacturer" do
    patch admin_manufacturer_url(@manufacturer), params: { manufacturer: { country: @manufacturer.country, data: @manufacturer.data, name: @manufacturer.name, website: @manufacturer.website } }
    assert_redirected_to admin_manufacturer_url(@manufacturer)
  end

  test "should not destroy manufacturer" do
    assert_difference("Manufacturer.count", 0) do
      delete manufacturer_url(@manufacturer)
    end

    assert_response :not_found
  end

  test "should destroy manufacturer" do
    assert_difference("Manufacturer.count", -1) do
      delete admin_manufacturer_url(@manufacturer)
    end

    assert_redirected_to admin_manufacturers_url
  end
end
