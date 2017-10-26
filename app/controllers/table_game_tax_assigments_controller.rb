class TableGameTaxAssigmentsController < ApplicationController
  before_action :set_table_game_tax_assigment, only: [:show, :edit, :update, :destroy]

  # GET /table_game_tax_assigments
  # GET /table_game_tax_assigments.json
  def index
    @table_game_tax_assigments = TableGameTaxAssigment.all
  end

  # GET /table_game_tax_assigments/1
  # GET /table_game_tax_assigments/1.json
  def show
  end

  # GET /table_game_tax_assigments/new
  def new
    @table_game_tax_assigment = TableGameTaxAssigment.new
  end

  # GET /table_game_tax_assigments/1/edit
  def edit
  end

  # POST /table_game_tax_assigments
  # POST /table_game_tax_assigments.json
  def create
    @table_game_tax_assigment = TableGameTaxAssigment.new(table_game_tax_assigment_params)

    respond_to do |format|
      if @table_game_tax_assigment.save
        format.html { redirect_to @table_game_tax_assigment, notice: 'Table game tax assigment was successfully created.' }
        format.json { render :show, status: :created, location: @table_game_tax_assigment }
      else
        format.html { render :new }
        format.json { render json: @table_game_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_game_tax_assigments/1
  # PATCH/PUT /table_game_tax_assigments/1.json
  def update
    respond_to do |format|
      if @table_game_tax_assigment.update(table_game_tax_assigment_params)
        format.html { redirect_to @table_game_tax_assigment, notice: 'Table game tax assigment was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_game_tax_assigment }
      else
        format.html { render :edit }
        format.json { render json: @table_game_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_game_tax_assigments/1
  # DELETE /table_game_tax_assigments/1.json
  def destroy
    @table_game_tax_assigment.destroy
    respond_to do |format|
      format.html { redirect_to table_game_tax_assigments_url, notice: 'Table game tax assigment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_game_tax_assigment
      @table_game_tax_assigment = TableGameTaxAssigment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_game_tax_assigment_params
      params.require(:table_game_tax_assigment).permit(:table_game_id, :tax_id)
    end
end
