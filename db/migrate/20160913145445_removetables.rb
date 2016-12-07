class Removetables < ActiveRecord::Migration
  def change
      drop_table :points
      drop_table :problems
  end
end
