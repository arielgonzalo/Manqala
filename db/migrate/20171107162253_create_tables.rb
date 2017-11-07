class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.boolean :is_outdoor
      t.string :location

      t.timestamps
    end
  end
end
