class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :is_active
      t.string :inactivation_text

      t.timestamps
    end
  end
end
