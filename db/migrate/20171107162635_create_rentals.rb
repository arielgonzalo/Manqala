class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :client, foreign_key: true
      t.references :board_game, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.references :table

      t.timestamps
    end
  end
end
