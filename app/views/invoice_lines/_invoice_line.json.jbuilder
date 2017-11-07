json.extract! invoice_line, :id, :invoice_id, :product_id, :pass_id, :quantity, :unit_price, :unit_total_price, :total_price, :created_at, :updated_at
json.url invoice_line_url(invoice_line, format: :json)
