class AddColumnsToReports < ActiveRecord::Migration
  def change
      add_column :reports, :point_of_t, :string
      add_column :reports, :problem, :string
  end
end
