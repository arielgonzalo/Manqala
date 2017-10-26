json.extract! invoice_detail, :id, :invoice_id, :product, :indications, :qt_ordered, :qt_served, :unitary_price, :total_tax, :total_price, :ordered_at, :finalized_at, :created_at, :updated_at
json.url invoice_detail_url(invoice_detail, format: :json)
