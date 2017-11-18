class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def generate_invoice_line(*args)

    @invoice = params[:invoice]
    @product = Product.find(params[:product_id])
    total = @product.price * params[:quantity]

    InvoiceLine.create( {:invoice_id=> @invoice, :product_id => @product_id, :unit_price => @product.price, :total => total })
    
  end
end
