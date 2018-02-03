class RevomeClientFromRentals < ActiveRecord::Migration[5.1]
  def change
  	remove_column :rentals, :client_id
  end
end
