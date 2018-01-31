class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @table = Table.find(params[:table])
    @invoice.table_id = @table_id
    @orders = Order.find_by_sql(["SELECT * FROM ORDERS WHERE invoiced = 'f' AND TABLE_ID = '?'", @table.id])
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end


  def generate_invoice

    @table = Table.find(params[:table])
    @total = 0
    if ActiveModel::Type::Boolean.new.cast( params[:detailed] ) 
      @orders = Order.select("PRODUCT_ID, SUM(QUANTITY) AS ORDERED, SUM(BILLED) as BILLED, SUM(BILLEABLE_QT) as BILLEABLE_QT").where("INVOICED = 'f' and PRODUCT_ID in (SELECT DISTINCT PRODUCT_ID FROM ORDERS WHERE BILLEABLE_QT > 0 AND INVOICED = 'f' AND TABLE_ID = :table_id ) and TABLE_ID = :table_id", {table_id: @table.id}).group("PRODUCT_ID")
      @orders.each do |order|
        product = Product.find(order.product_id)
        line_total = (order.BILLEABLE_QT) * product.price
        @total = @total + line_total
      end
    else 
      @orders = Order.select("PRODUCT_ID, SUM(QUANTITY) AS ORDERED, SUM(BILLED) as BILLED").where("INVOICED = 'f' and TABLE_ID = :table_id", {table_id: @table.id}).group("PRODUCT_ID")
      @orders.each do |order|
        product = Product.find(order.product_id)
        line_total = (order.ORDERED - order.BILLED) * product.price
        @total = @total + line_total
      end
    end
    @invoice = Invoice.create( {:table_id=> @table.id, :total => @total, :detailed => params[:detailed] })
      if ActiveModel::Type::Boolean.new.cast( params[:detailed] )
        respond_to do |format|
          format.html { redirect_to invoice_path(@invoice)}

        end
      end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:client_id, :table_id, :user_id, :subtotal, :taxes, :service, :total, :date_time, :detailed)
    end
end
