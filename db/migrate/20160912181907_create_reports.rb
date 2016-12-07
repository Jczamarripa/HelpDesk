class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :prioridad
      t.integer :status
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
