class Invoice < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :table, optional: true
  after_save :create_lines

  def create_lines
  	@invoice = Invoice.find(self.id)
  	  @orders = Order.find_by_sql(["SELECT * FROM ORDERS WHERE STATUS < 5 AND TABLE_ID = '?'", @invoice.table_id] )
      @orders.each do |order|
        product = Product.find(order.product_id)
        line_total = order.quantity * product.price
        InvoiceLine.create( {:invoice_id=> @invoice.id, :quantity => order.quantity, :product_id => product.id, :unit_price => product.price, :total_price => line_total })
        order.update_attributes(:status => 5)
    	order.save
      end

  end

end
