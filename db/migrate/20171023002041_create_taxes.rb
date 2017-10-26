class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.string :name
      t.float :percentage

      t.timestamps
    end
  end
end
