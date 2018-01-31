class CreateBoardGames < ActiveRecord::Migration[5.1]
  def change
    create_table :board_games do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.integer :backup_quantity
      t.float :replacement_cost
      t.integer :difficulty
      t.references :board_game_category, foreign_key: true

      t.timestamps
    end
  end
end
