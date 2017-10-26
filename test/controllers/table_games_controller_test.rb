require 'test_helper'

class TableGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table_game = table_games(:one)
  end

  test "should get index" do
    get table_games_url
    assert_response :success
  end

  test "should get new" do
    get new_table_game_url
    assert_response :success
  end

  test "should create table_game" do
    assert_difference('TableGame.count') do
      post table_games_url, params: { table_game: { bin: @table_game.bin, description: @table_game.description, dificulty_level: @table_game.dificulty_level, name: @table_game.name, outdoor_usable: @table_game.outdoor_usable, penalty_cost: @table_game.penalty_cost, qt_in_bk: @table_game.qt_in_bk, qt_in_use: @table_game.qt_in_use, serial: @table_game.serial } }
    end

    assert_redirected_to table_game_url(TableGame.last)
  end

  test "should show table_game" do
    get table_game_url(@table_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_game_url(@table_game)
    assert_response :success
  end

  test "should update table_game" do
    patch table_game_url(@table_game), params: { table_game: { bin: @table_game.bin, description: @table_game.description, dificulty_level: @table_game.dificulty_level, name: @table_game.name, outdoor_usable: @table_game.outdoor_usable, penalty_cost: @table_game.penalty_cost, qt_in_bk: @table_game.qt_in_bk, qt_in_use: @table_game.qt_in_use, serial: @table_game.serial } }
    assert_redirected_to table_game_url(@table_game)
  end

  test "should destroy table_game" do
    assert_difference('TableGame.count', -1) do
      delete table_game_url(@table_game)
    end

    assert_redirected_to table_games_url
  end
end
