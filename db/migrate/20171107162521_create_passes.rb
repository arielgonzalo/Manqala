class CreatePasses < ActiveRecord::Migration[5.1]
  def change
    create_table :passes do |t|
      t.date :start_time
      t.date :end_time
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
