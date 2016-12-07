class AddColumnStateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :state, :string, default: "recibido"
    remove_column :reports,:status,:integer  
  end
end
