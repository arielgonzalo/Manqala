class KitchenController < ApplicationController
  

  def index
  	#@orders = Order.select("product_id, quantity, table_id, date_time, comment").where('product_id <> NULL AND status <> 2').order(:date_time)
  	@orders = Order.find_by_sql(["SELECT * FROM ORDERS WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT ID FROM CATEGORIES WHERE IS_BAR = 'f') )"])
  end
end
