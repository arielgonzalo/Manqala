class TablesController < ApplicationController
  before_action :set_table, only: [:detailed_invoice, :show, :edit, :update, :destroy]

  #before_action :set_orders, only: [:show]


  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  def admin_index
    @tables = Table.all
  end

  def invoice_index
    @tables = Table.find_by_sql(["SELECT * FROM TABLES WHERE ID IN (SELECT DISTINCT TABLE_ID FROM ORDERS WHERE invoiced = 'f')"])
  end

  def detailed_invoice
    Order.where(["invoiced = 'f' and table_id = '?'", @table.id]).each do |order| 
      order.update_attributes(:billeable_qt => 0)
    end
    @orders = Order.select("PRODUCT_ID, SUM(QUANTITY) AS ORDERED, SUM(BILLED) as BILLED").where("INVOICED = 'f' and TABLE_ID = :table_id", {table_id: @table.id}).group("PRODUCT_ID")

  end
  # GET /tables/1
  # GET /tables/1.json
  def show
    @orders = Order.find_by_sql(["SELECT * FROM ORDERS WHERE (invoiced = 'f' or status < 4) AND TABLE_id = '?' ORDER BY created_at ASC", @table.id])
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to admin_index_tables_path, notice: 'Mesa creada!.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to admin_index_tables_path, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_tables_path, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_billeable
    @order = Order.where("invoiced = 'f' and product_id = :element_id and table_id = :table_id", :element_id => params[:element_id], :table_id => @table_id).first
    if @order != nil  
      @order.update_attributes(:billeable_qt => params[:element_value])
      if @order.save
         #redirect_to table_path(@table)
      end
    end  
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

   # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :is_outdoor, :location)
    end
end
