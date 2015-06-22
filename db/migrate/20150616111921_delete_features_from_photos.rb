class DeleteFeaturesFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :latitude
    remove_column :photos, :longitude
    remove_column :photos, :comment
  end
end
