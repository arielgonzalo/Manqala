require 'test_helper'

class LibraryAccessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_access = library_accesses(:one)
  end

  test "should get index" do
    get library_accesses_url
    assert_response :success
  end

  test "should get new" do
    get new_library_access_url
    assert_response :success
  end

  test "should create library_access" do
    assert_difference('LibraryAccess.count') do
      post library_accesses_url, params: { library_access: { end_time: @library_access.end_time, start_time: @library_access.start_time } }
    end

    assert_redirected_to library_access_url(LibraryAccess.last)
  end

  test "should show library_access" do
    get library_access_url(@library_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_access_url(@library_access)
    assert_response :success
  end

  test "should update library_access" do
    patch library_access_url(@library_access), params: { library_access: { end_time: @library_access.end_time, start_time: @library_access.start_time } }
    assert_redirected_to library_access_url(@library_access)
  end

  test "should destroy library_access" do
    assert_difference('LibraryAccess.count', -1) do
      delete library_access_url(@library_access)
    end

    assert_redirected_to library_accesses_url
  end
end
