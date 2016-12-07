class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nombre
      t.string :rfc
      t.text :razon_social
      t.string :telefono
      t.string :contacto
      t.string :nomenclatura
      t.integer :status

      t.timestamps null: false
    end
  end
end
