class RevomefkeysFromReports < ActiveRecord::Migration
  def change
     change_table :reports do |t|
         remove_foreign_key :reports,:points
         remove_foreign_key :reports, :problems
     end
  end
end
