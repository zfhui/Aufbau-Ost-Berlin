class AddIndexToPhotosAndBuildings < ActiveRecord::Migration
  def change
    add_index :photos, :building_id
    add_index :buildings, :tour_id
  end
end
