class KitchenController < ApplicationController
  

  def index
  	#@orders = Order.select("product_id, quantity, table_id, date_time, comment").where('product_id <> NULL AND status <> 2').order(:date_time)

  	@orders = Order.find_by_sql(["SELECT * FROM ORDERS WHERE status = 1 AND PRODUCT_ID IN (SELECT ID FROM PRODUCTS WHERE CATEGORY_ID IN (SELECT ID FROM CATEGORIES WHERE IS_BAR = 'f') ) ORDER BY created_at ASC"])

  end
end
