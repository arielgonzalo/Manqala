require 'test_helper'

class FoodTaxAssigmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_tax_assigment = food_tax_assigments(:one)
  end

  test "should get index" do
    get food_tax_assigments_url
    assert_response :success
  end

  test "should get new" do
    get new_food_tax_assigment_url
    assert_response :success
  end

  test "should create food_tax_assigment" do
    assert_difference('FoodTaxAssigment.count') do
      post food_tax_assigments_url, params: { food_tax_assigment: { food_id: @food_tax_assigment.food_id, tax_id: @food_tax_assigment.tax_id } }
    end

    assert_redirected_to food_tax_assigment_url(FoodTaxAssigment.last)
  end

  test "should show food_tax_assigment" do
    get food_tax_assigment_url(@food_tax_assigment)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_tax_assigment_url(@food_tax_assigment)
    assert_response :success
  end

  test "should update food_tax_assigment" do
    patch food_tax_assigment_url(@food_tax_assigment), params: { food_tax_assigment: { food_id: @food_tax_assigment.food_id, tax_id: @food_tax_assigment.tax_id } }
    assert_redirected_to food_tax_assigment_url(@food_tax_assigment)
  end

  test "should destroy food_tax_assigment" do
    assert_difference('FoodTaxAssigment.count', -1) do
      delete food_tax_assigment_url(@food_tax_assigment)
    end

    assert_redirected_to food_tax_assigments_url
  end
end
