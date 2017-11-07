json.extract! order, :id, :table_id, :product_id, :pass_id, :quantity, :status, :date_time, :comment, :created_at, :updated_at
json.url order_url(order, format: :json)
