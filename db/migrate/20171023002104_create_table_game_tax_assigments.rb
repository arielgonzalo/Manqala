class CreateTableGameTaxAssigments < ActiveRecord::Migration[5.1]
  def change
    create_table :table_game_tax_assigments do |t|
      t.references :table_game, foreign_key: true
      t.references :tax, foreign_key: true

      t.timestamps
    end
  end
end
