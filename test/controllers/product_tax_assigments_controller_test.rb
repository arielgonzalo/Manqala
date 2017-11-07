require 'test_helper'

class ProductTaxAssigmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_tax_assigment = product_tax_assigments(:one)
  end

  test "should get index" do
    get product_tax_assigments_url
    assert_response :success
  end

  test "should get new" do
    get new_product_tax_assigment_url
    assert_response :success
  end

  test "should create product_tax_assigment" do
    assert_difference('ProductTaxAssigment.count') do
      post product_tax_assigments_url, params: { product_tax_assigment: { food_id: @product_tax_assigment.food_id, tax_id: @product_tax_assigment.tax_id } }
    end

    assert_redirected_to product_tax_assigment_url(ProductTaxAssigment.last)
  end

  test "should show product_tax_assigment" do
    get product_tax_assigment_url(@product_tax_assigment)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_tax_assigment_url(@product_tax_assigment)
    assert_response :success
  end

  test "should update product_tax_assigment" do
    patch product_tax_assigment_url(@product_tax_assigment), params: { product_tax_assigment: { food_id: @product_tax_assigment.food_id, tax_id: @product_tax_assigment.tax_id } }
    assert_redirected_to product_tax_assigment_url(@product_tax_assigment)
  end

  test "should destroy product_tax_assigment" do
    assert_difference('ProductTaxAssigment.count', -1) do
      delete product_tax_assigment_url(@product_tax_assigment)
    end

    assert_redirected_to product_tax_assigments_url
  end
end
