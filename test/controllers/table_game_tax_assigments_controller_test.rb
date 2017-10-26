require 'test_helper'

class TableGameTaxAssigmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table_game_tax_assigment = table_game_tax_assigments(:one)
  end

  test "should get index" do
    get table_game_tax_assigments_url
    assert_response :success
  end

  test "should get new" do
    get new_table_game_tax_assigment_url
    assert_response :success
  end

  test "should create table_game_tax_assigment" do
    assert_difference('TableGameTaxAssigment.count') do
      post table_game_tax_assigments_url, params: { table_game_tax_assigment: { table_game_id: @table_game_tax_assigment.table_game_id, tax_id: @table_game_tax_assigment.tax_id } }
    end

    assert_redirected_to table_game_tax_assigment_url(TableGameTaxAssigment.last)
  end

  test "should show table_game_tax_assigment" do
    get table_game_tax_assigment_url(@table_game_tax_assigment)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_game_tax_assigment_url(@table_game_tax_assigment)
    assert_response :success
  end

  test "should update table_game_tax_assigment" do
    patch table_game_tax_assigment_url(@table_game_tax_assigment), params: { table_game_tax_assigment: { table_game_id: @table_game_tax_assigment.table_game_id, tax_id: @table_game_tax_assigment.tax_id } }
    assert_redirected_to table_game_tax_assigment_url(@table_game_tax_assigment)
  end

  test "should destroy table_game_tax_assigment" do
    assert_difference('TableGameTaxAssigment.count', -1) do
      delete table_game_tax_assigment_url(@table_game_tax_assigment)
    end

    assert_redirected_to table_game_tax_assigments_url
  end
end
