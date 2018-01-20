class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :mark_as_completed_kitchen, :mark_as_completed_bar]
  before_action :set_table
  before_action :set_categories, only: [:new]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end


  def mark_as_served
    @order = Order.find(params[:id])
    @order.update_attributes(:status => 4)
    if @order.save
       redirect_to table_path(@table)
    end
  end

  def change_to_invoice(value)
    @order.update_attributes(:invoiced => value)
    puts @order.errors.full_messages
    # ... update successful
  end

  def mark_as_billable
    @order = Order.find(params[:id])
    @order.update_attributes(:billable => !@order.billable)
    if @order.save
       redirect_to table_path(@table)
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.table = @table
    ordered_product = params[:ordered_product].to_i
    @order.product_id = ordered_product
    @order.quantity = params["qt_"+ordered_product.to_s]
    @order.comment = params["comment_"+ordered_product.to_s]
    @order.status = 1
    respond_to do |format|
      if @order.save
        format.html { redirect_to @table, notice: 'Orden creada con éxito.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to new_table_order_path(@table), notice: 'Ingrese la cantidad!.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @table, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to @table, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_completed_kitchen
    @order = Order.find(params[:id])
    @order.update_attributes(:status => 3)
    if @order.save
       redirect_to kitchen_index_path
    end
  end

  def mark_as_completed_bar
    @order = Order.find(params[:id])
    @order.update_attributes(:status => 3)
    if @order.save
       redirect_to bar_index_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_table
      @table = Table.find(params[:table_id])
    end

    def set_categories
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:table_id, :product_id, :pass_id, :quantity, :status, :date_time, :comment)
    end
end
