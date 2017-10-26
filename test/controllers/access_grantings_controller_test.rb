require 'test_helper'

class AccessGrantingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @access_granting = access_grantings(:one)
  end

  test "should get index" do
    get access_grantings_url
    assert_response :success
  end

  test "should get new" do
    get new_access_granting_url
    assert_response :success
  end

  test "should create access_granting" do
    assert_difference('AccessGranting.count') do
      post access_grantings_url, params: { access_granting: { client_id: @access_granting.client_id, library_access_id: @access_granting.library_access_id } }
    end

    assert_redirected_to access_granting_url(AccessGranting.last)
  end

  test "should show access_granting" do
    get access_granting_url(@access_granting)
    assert_response :success
  end

  test "should get edit" do
    get edit_access_granting_url(@access_granting)
    assert_response :success
  end

  test "should update access_granting" do
    patch access_granting_url(@access_granting), params: { access_granting: { client_id: @access_granting.client_id, library_access_id: @access_granting.library_access_id } }
    assert_redirected_to access_granting_url(@access_granting)
  end

  test "should destroy access_granting" do
    assert_difference('AccessGranting.count', -1) do
      delete access_granting_url(@access_granting)
    end

    assert_redirected_to access_grantings_url
  end
end
