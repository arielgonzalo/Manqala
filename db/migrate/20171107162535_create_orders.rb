class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :table, foreign_key: true
      t.references :product, foreign_key: true
      t.references :pass, foreign_key: true
      t.integer :quantity
      t.integer :status
      t.date :date_time
      t.string :comment

      t.timestamps
    end
  end
end
