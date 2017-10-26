class CreateAccessGrantings < ActiveRecord::Migration[5.1]
  def change
    create_table :access_grantings do |t|
      t.references :client, foreign_key: true
      t.references :library_access, foreign_key: true

      t.timestamps
    end
  end
end
