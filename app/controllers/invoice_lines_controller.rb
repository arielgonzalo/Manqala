class InvoiceLinesController < ApplicationController
  before_action :set_invoice_line, only: [:show, :edit, :update, :destroy]
  helper_method :generate_invoice_line

  # GET /invoice_lines
  # GET /invoice_lines.json
  def index
    @invoice_lines = InvoiceLine.all
  end

  # GET /invoice_lines/1
  # GET /invoice_lines/1.json
  def show
  end

  # GET /invoice_lines/new
  def new
    @invoice_line = InvoiceLine.new
  end

  def generate_invoice_line(*args)

    @invoice = params[:invoice]
    @product = Product.find(params[:product_id])
    total = @product.price * params[:quantity]

    InvoiceLine.create( {:invoice_id=> @invoice, :product_id => @product_id, :unit_price => @product.price, :total => total })
    
  end

  # GET /invoice_lines/1/edit
  def edit
  end

  # POST /invoice_lines
  # POST /invoice_lines.json
  def create
    @invoice_line = InvoiceLine.new(invoice_line_params)

    respond_to do |format|
      if @invoice_line.save
        format.html { redirect_to @invoice_line, notice: 'Invoice line was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_line }
      else
        format.html { render :new }
        format.json { render json: @invoice_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_lines/1
  # PATCH/PUT /invoice_lines/1.json
  def update
    respond_to do |format|
      if @invoice_line.update(invoice_line_params)
        format.html { redirect_to @invoice_line, notice: 'Invoice line was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_line }
      else
        format.html { render :edit }
        format.json { render json: @invoice_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_lines/1
  # DELETE /invoice_lines/1.json
  def destroy
    @invoice_line.destroy
    respond_to do |format|
      format.html { redirect_to invoice_lines_url, notice: 'Invoice line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_line
      @invoice_line = InvoiceLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_line_params
      params.require(:invoice_line).permit(:invoice_id, :product_id, :pass_id, :quantity, :unit_price, :unit_total_price, :total_price)
    end
end
