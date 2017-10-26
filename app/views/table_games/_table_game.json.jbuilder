json.extract! table_game, :id, :name, :description, :qt_in_use, :qt_in_bk, :penalty_cost, :serial, :bin, :dificulty_level, :outdoor_usable, :created_at, :updated_at
json.url table_game_url(table_game, format: :json)
