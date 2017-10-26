class CreateTableGames < ActiveRecord::Migration[5.1]
  def change
    create_table :table_games do |t|
      t.string :name
      t.string :description
      t.integer :qt_in_use
      t.integer :qt_in_bk
      t.float :penalty_cost
      t.string :serial
      t.string :bin
      t.integer :dificulty_level
      t.boolean :outdoor_usable

      t.timestamps
    end
  end
end
