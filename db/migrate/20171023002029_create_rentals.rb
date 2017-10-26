class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :client, foreign_key: true
      t.references :table_game, foreign_key: true

      t.timestamps
    end
  end
end
