class CreateInvoiceLines < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_lines do |t|
      t.references :invoice, foreign_key: true
      t.references :product, foreign_key: true
      t.references :pass, foreign_key: true
      t.integer :quantity
      t.float :unit_price
      t.float :unit_total_price
      t.float :total_price

      t.timestamps
    end
  end
end
