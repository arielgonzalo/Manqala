class AddBilleableQt < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :billeable_qt, :integer, default: 0
  end
end
