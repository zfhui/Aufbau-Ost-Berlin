class AddTourPositionToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :tour_position, :integer
  end
end
