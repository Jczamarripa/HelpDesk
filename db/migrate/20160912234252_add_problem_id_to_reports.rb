class AddProblemIdToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :problem, index: true, foreign_key: true
  end
end
