class AddIsBarToCategory < ActiveRecord::Migration[5.1]
  def change
  	add_column :categories, :is_bar, :boolean, default: false
  end
end
