require 'test_helper'

class BoardGameCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_game_category = board_game_categories(:one)
  end

  test "should get index" do
    get board_game_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_board_game_category_url
    assert_response :success
  end

  test "should create board_game_category" do
    assert_difference('BoardGameCategory.count') do
      post board_game_categories_url, params: { board_game_category: { description: @board_game_category.description, name: @board_game_category.name } }
    end

    assert_redirected_to board_game_category_url(BoardGameCategory.last)
  end

  test "should show board_game_category" do
    get board_game_category_url(@board_game_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_game_category_url(@board_game_category)
    assert_response :success
  end

  test "should update board_game_category" do
    patch board_game_category_url(@board_game_category), params: { board_game_category: { description: @board_game_category.description, name: @board_game_category.name } }
    assert_redirected_to board_game_category_url(@board_game_category)
  end

  test "should destroy board_game_category" do
    assert_difference('BoardGameCategory.count', -1) do
      delete board_game_category_url(@board_game_category)
    end

    assert_redirected_to board_game_categories_url
  end
end
