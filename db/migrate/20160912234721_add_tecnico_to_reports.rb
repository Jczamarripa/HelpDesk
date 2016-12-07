class AddTecnicoToReports < ActiveRecord::Migration
  def change
      add_column :reports, :tecnico, :integer
  end
end
