class FoodTaxAssigmentsController < ApplicationController
  before_action :set_food_tax_assigment, only: [:show, :edit, :update, :destroy]

  # GET /food_tax_assigments
  # GET /food_tax_assigments.json
  def index
    @food_tax_assigments = FoodTaxAssigment.all
  end

  # GET /food_tax_assigments/1
  # GET /food_tax_assigments/1.json
  def show
  end

  # GET /food_tax_assigments/new
  def new
    @food_tax_assigment = FoodTaxAssigment.new
  end

  # GET /food_tax_assigments/1/edit
  def edit
  end

  # POST /food_tax_assigments
  # POST /food_tax_assigments.json
  def create
    @food_tax_assigment = FoodTaxAssigment.new(food_tax_assigment_params)

    respond_to do |format|
      if @food_tax_assigment.save
        format.html { redirect_to @food_tax_assigment, notice: 'Food tax assigment was successfully created.' }
        format.json { render :show, status: :created, location: @food_tax_assigment }
      else
        format.html { render :new }
        format.json { render json: @food_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_tax_assigments/1
  # PATCH/PUT /food_tax_assigments/1.json
  def update
    respond_to do |format|
      if @food_tax_assigment.update(food_tax_assigment_params)
        format.html { redirect_to @food_tax_assigment, notice: 'Food tax assigment was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_tax_assigment }
      else
        format.html { render :edit }
        format.json { render json: @food_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_tax_assigments/1
  # DELETE /food_tax_assigments/1.json
  def destroy
    @food_tax_assigment.destroy
    respond_to do |format|
      format.html { redirect_to food_tax_assigments_url, notice: 'Food tax assigment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_tax_assigment
      @food_tax_assigment = FoodTaxAssigment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_tax_assigment_params
      params.require(:food_tax_assigment).permit(:food_id, :tax_id)
    end
end
