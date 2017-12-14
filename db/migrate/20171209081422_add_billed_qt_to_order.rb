class AddBilledQtToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :billed, :integer, default: 0
  end
end
