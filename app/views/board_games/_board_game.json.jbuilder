json.extract! board_game, :id, :name, :description, :quantity, :backup_quantity, :replacement_cost, :difficulty, :type, :board_game_category_id, :created_at, :updated_at
json.url board_game_url(board_game, format: :json)
