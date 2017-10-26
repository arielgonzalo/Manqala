json.extract! invoice, :id, :date_time, :client_id, :amount, :tax_amount, :total_amount, :table_number, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
