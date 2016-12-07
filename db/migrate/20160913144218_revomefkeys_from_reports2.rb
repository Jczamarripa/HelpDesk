class RevomefkeysFromReports2 < ActiveRecord::Migration
  def change
     remove_column :reports,:problem_id
    remove_column :reports,:point_id
  end
end
