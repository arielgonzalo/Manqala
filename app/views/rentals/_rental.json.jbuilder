json.extract! rental, :id, :client_id, :board_game_id, :start_time, :end_time, :table, :created_at, :updated_at
json.url rental_url(rental, format: :json)
