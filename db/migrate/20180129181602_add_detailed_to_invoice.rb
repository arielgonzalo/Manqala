class AddDetailedToInvoice < ActiveRecord::Migration[5.1]
  def change
  	add_column :invoices, :detailed, :boolean, default: false
  end
end
