class KitchenController < ApplicationController
  

  def index
  	@data = Order.select("product_id, quantity, table_id, date_time, comment").where('product_id <> NULL AND status <> 2').order(:date_time)
  end
end
