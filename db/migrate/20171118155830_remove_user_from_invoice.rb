class RemoveUserFromInvoice < ActiveRecord::Migration[5.1]
  def change
  	remove_column :invoices, :user_id
  end
end
