class AddBuildingIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :building_id, :integer, index: true
  end
end
