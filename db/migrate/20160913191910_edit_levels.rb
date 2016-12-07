class EditLevels < ActiveRecord::Migration
  def change
      remove_column :users,:level,:integer
      remove_column :users,:status,:integer
      remove_column :companies,:status,:integer
      add_column :users,:permission_level,:integer,default: 1
      
  end
end
