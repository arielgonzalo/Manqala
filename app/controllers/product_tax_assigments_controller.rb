class ProductTaxAssigmentsController < ApplicationController
  before_action :set_product_tax_assigment, only: [:show, :edit, :update, :destroy]

  # GET /product_tax_assigments
  # GET /product_tax_assigments.json
  def index
    @product_tax_assigments = ProductTaxAssigment.all
  end

  # GET /product_tax_assigments/1
  # GET /product_tax_assigments/1.json
  def show
  end

  # GET /product_tax_assigments/new
  def new
    @product_tax_assigment = ProductTaxAssigment.new
  end

  # GET /product_tax_assigments/1/edit
  def edit
  end

  # POST /product_tax_assigments
  # POST /product_tax_assigments.json
  def create
    @product_tax_assigment = ProductTaxAssigment.new(product_tax_assigment_params)

    respond_to do |format|
      if @product_tax_assigment.save
        format.html { redirect_to @product_tax_assigment, notice: 'Product tax assigment was successfully created.' }
        format.json { render :show, status: :created, location: @product_tax_assigment }
      else
        format.html { render :new }
        format.json { render json: @product_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_tax_assigments/1
  # PATCH/PUT /product_tax_assigments/1.json
  def update
    respond_to do |format|
      if @product_tax_assigment.update(product_tax_assigment_params)
        format.html { redirect_to @product_tax_assigment, notice: 'Product tax assigment was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_tax_assigment }
      else
        format.html { render :edit }
        format.json { render json: @product_tax_assigment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_tax_assigments/1
  # DELETE /product_tax_assigments/1.json
  def destroy
    @product_tax_assigment.destroy
    respond_to do |format|
      format.html { redirect_to product_tax_assigments_url, notice: 'Product tax assigment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_tax_assigment
      @product_tax_assigment = ProductTaxAssigment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_tax_assigment_params
      params.require(:product_tax_assigment).permit(:food_id, :tax_id)
    end
end
