class Invoice < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :table, optional: true
  after_save :create_lines

  def create_lines
  	@invoice = Invoice.find(self.id)
  	  @orders = Order.select("PRODUCT_ID, SUM(INVOICED) AS INVOICED, SUM(QUANTITY) AS quantity").where("INVOICED = 'f' and TABLE_ID = :table_id", {table_id: @invoice.table_id}).group("PRODUCT_ID")
      @orders.each do |order|
        product = Product.find(order.product_id)
        line_total = order.quantity * product.price
        InvoiceLine.create( {:invoice_id=> @invoice.id, :quantity => order.quantity, :product_id => product.id, :unit_price => product.price, :total_price => line_total })
        order.update_attributes(:invoiced => true)
    	order.save
      end

  end

end
