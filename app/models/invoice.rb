class Invoice < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :table, optional: true
  after_save :create_lines

  def create_lines
  	@invoice = Invoice.find(self.id)
      if(@invoice.detailed)
  	    @orders = Order.select("PRODUCT_ID, SUM(QUANTITY) AS ORDERED, SUM(BILLED) as BILLED, SUM(BILLEABLE_QT) as BILLEABLE_QT").where("INVOICED = 'f' and PRODUCT_ID in (SELECT DISTINCT PRODUCT_ID FROM ORDERS WHERE BILLEABLE_QT > 0 and TABLE_ID = :table_id and INVOICED = 'f' ) and TABLE_ID = :table_id", {table_id: @invoice.table_id}).group("PRODUCT_ID")
      else
        @orders = Order.select("PRODUCT_ID, SUM(QUANTITY) AS ORDERED, SUM(BILLED) as BILLED, SUM(BILLEABLE_QT) as BILLEABLE_QT").where("INVOICED = 'f' and TABLE_ID = :table_id", {table_id: @invoice.table_id}).group("PRODUCT_ID")
      end
      @orders.each do |order|
        product = Product.find(order.product_id)
        if(@invoice.detailed)
          billeable = order.BILLEABLE_QT
        else
          billeable = order.ORDERED - order.BILLED
        end  
        line_total = billeable * product.price
        InvoiceLine.create( {:invoice_id=> @invoice.id, :quantity => billeable, :product_id => product.id, :unit_price => product.price, :total_price => line_total })
        if(@invoice.detailed && (billeable + order.BILLED) < order.ORDERED  )
          order_line = Order.where("INVOICED = 'f' and PRODUCT_ID = :product_id and TABLE_ID = :table_id", {table_id: @invoice.table_id, product_id: order.product_id}).first
          order_line.update_attributes(:billed => order.BILLED + billeable)
          order_line.save
        else
          @order_lines = Order.where("INVOICED = 'f' and PRODUCT_ID = :product_id and TABLE_ID = :table_id", {table_id: @invoice.table_id, product_id: order.product_id}).each do |order_line|
            order_line.update_attributes(:invoiced => true)
            order_line.save
          end
        end 
      end

  end

end
