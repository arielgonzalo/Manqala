class CreateProductTaxAssigments < ActiveRecord::Migration[5.1]
  def change
    create_table :product_tax_assigments do |t|
      t.references :food, foreign_key: true
      t.references :tax, foreign_key: true

      t.timestamps
    end
  end
end
