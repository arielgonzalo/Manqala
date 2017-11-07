json.extract! client, :id, :pid, :name, :email, :phone, :is_active, :inactivation_text, :created_at, :updated_at
json.url client_url(client, format: :json)
