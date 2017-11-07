class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :client, foreign_key: true
      t.references :table, foreign_key: true
      t.references :user, foreign_key: true
      t.float :subtotal
      t.float :taxes
      t.float :service
      t.float :total
      t.date :date_time

      t.timestamps
    end
  end
end
