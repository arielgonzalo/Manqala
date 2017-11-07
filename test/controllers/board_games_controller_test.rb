require 'test_helper'

class BoardGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_game = board_games(:one)
  end

  test "should get index" do
    get board_games_url
    assert_response :success
  end

  test "should get new" do
    get new_board_game_url
    assert_response :success
  end

  test "should create board_game" do
    assert_difference('BoardGame.count') do
      post board_games_url, params: { board_game: { backup_quantity: @board_game.backup_quantity, category_id: @board_game.category_id, description: @board_game.description, difficulty: @board_game.difficulty, name: @board_game.name, quantity: @board_game.quantity, replacement_cost: @board_game.replacement_cost, type: @board_game.type } }
    end

    assert_redirected_to board_game_url(BoardGame.last)
  end

  test "should show board_game" do
    get board_game_url(@board_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_game_url(@board_game)
    assert_response :success
  end

  test "should update board_game" do
    patch board_game_url(@board_game), params: { board_game: { backup_quantity: @board_game.backup_quantity, category_id: @board_game.category_id, description: @board_game.description, difficulty: @board_game.difficulty, name: @board_game.name, quantity: @board_game.quantity, replacement_cost: @board_game.replacement_cost, type: @board_game.type } }
    assert_redirected_to board_game_url(@board_game)
  end

  test "should destroy board_game" do
    assert_difference('BoardGame.count', -1) do
      delete board_game_url(@board_game)
    end

    assert_redirected_to board_games_url
  end
end
