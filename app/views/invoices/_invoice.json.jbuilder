json.extract! invoice, :id, :client_id, :table_id, :user_id, :subtotal, :taxes, :service, :total, :date_time, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
