class CreateInvoiceDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_details do |t|
      t.references :invoice, foreign_key: true
      t.string :product
      t.string :indications
      t.integer :qt_ordered
      t.integer :qt_served
      t.float :unitary_price
      t.float :total_tax
      t.float :total_price
      t.time :ordered_at
      t.time :finalized_at

      t.timestamps
    end
  end
end
