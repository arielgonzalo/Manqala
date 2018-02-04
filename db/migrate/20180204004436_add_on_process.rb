class AddOnProcess < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :on_process, :boolean, default: false
  end
end
