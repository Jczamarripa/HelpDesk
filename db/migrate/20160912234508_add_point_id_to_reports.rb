class AddPointIdToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :point, index: true, foreign_key: true
  end
end
