class BoardGameCategoriesController < ApplicationController
  before_action :set_board_game_category, only: [:show, :edit, :update, :destroy]

  # GET /board_game_categories
  # GET /board_game_categories.json
  def index
    @board_game_categories = BoardGameCategory.all
  end


  def admin_index
    @board_game_categories = BoardGameCategory.all
  end

  # GET /board_game_categories/1
  # GET /board_game_categories/1.json
  def show
    @board_games = @board_game_category.board_games
  end

  # GET /board_game_categories/new
  def new
    @board_game_category = BoardGameCategory.new
  end

  # GET /board_game_categories/1/edit
  def edit
  end

  # POST /board_game_categories
  # POST /board_game_categories.json
  def create
    @board_game_category = BoardGameCategory.new(board_game_category_params)

    respond_to do |format|
      if @board_game_category.save
        format.html { redirect_to admin_index_board_game_categories_path, notice: 'Board game category was successfully created.' }
        format.json { render :show, status: :created, location: @board_game_category }
      else
        format.html { render :new }
        format.json { render json: @board_game_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_game_categories/1
  # PATCH/PUT /board_game_categories/1.json
  def update
    respond_to do |format|
      if @board_game_category.update(board_game_category_params)
        format.html { redirect_to admin_index_board_game_categories_path, notice: 'Board game category was successfully updated.' }
        format.json { render :show, status: :ok, location: @board_game_category }
      else
        format.html { render :edit }
        format.json { render json: @board_game_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_game_categories/1
  # DELETE /board_game_categories/1.json
  def destroy
    @board_game_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_board_game_categories_path, notice: 'Board game category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_game_category
      @board_game_category = BoardGameCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_game_category_params
      params.require(:board_game_category).permit(:name, :description)
    end
end
