class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.time :date_time
      t.references :client, foreign_key: true
      t.float :amount
      t.float :tax_amount
      t.float :total_amount
      t.integer :table_number

      t.timestamps
    end
  end
end
