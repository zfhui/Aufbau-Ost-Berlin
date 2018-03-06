class DropBuildingsAndToursTable < ActiveRecord::Migration
  def change
    drop_table :tours
    drop_table :buildings
  end
end
