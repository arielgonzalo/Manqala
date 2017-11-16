class KitchenController < ApplicationController
  

  def index
  	#@orders = Order.select("product_id, quantity, table_id, date_time, comment").where('product_id <> NULL AND status <> 2').order(:date_time)
  	@orders = Order.all
  end
end
