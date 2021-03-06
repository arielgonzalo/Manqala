class BoardGamesController < ApplicationController
  before_action :set_board_game, only: [:show, :edit, :update, :destroy]
  before_action :set_board_game_category
  # GET /board_games
  # GET /board_games.json
  def index
    @board_games = BoardGame.all
  end

  def admin_index 
    @board_games = BoardGame.all
  end

  # GET /board_games/1
  # GET /board_games/1.json
  def show

  end

  # GET /board_games/new
  def new
    @board_game = BoardGame.new
  end

  # GET /board_games/1/edit
  def edit
  end

  # POST /board_games
  # POST /board_games.json
  def create
    @board_game = BoardGame.new(board_game_params)
    @board_game.board_game_category = @board_game_category
    respond_to do |format|
      if @board_game.save
        format.html { redirect_to [@board_game_category], notice: 'Board game was successfully created.' }
        format.json { render :show, status: :created, location: @board_game }
      else
        format.html { render :new }
        format.json { render json: @board_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_games/1
  # PATCH/PUT /board_games/1.json
  def update
    respond_to do |format|
      if @board_game.update(board_game_params)
        format.html { redirect_to [@board_game_category], notice: 'Board game was successfully updated.' }
        format.json { render :show, status: :ok, location: @board_game }
      else
        format.html { render :edit }
        format.json { render json: @board_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_games/1
  # DELETE /board_games/1.json
  def destroy
    @board_game.destroy
    respond_to do |format|
      format.html { redirect_to [@board_game_category], notice: 'Board game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_game
      @board_game = BoardGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_game_params
      params.require(:board_game).permit(:name, :description, :quantity, :backup_quantity, :replacement_cost, :difficulty, :board_game_category_id, :photo)
    end

    def set_board_game_category

      @board_game_category = BoardGameCategory.find(params[:board_game_category_id])

    end
end
