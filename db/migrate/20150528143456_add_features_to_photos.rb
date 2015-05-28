class AddFeaturesToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :index_card_no, :integer
    add_column :photos, :photo_no,      :string
    add_column :photos, :photographer,  :string
    add_column :photos, :year,          :integer
    add_column :photos, :type,          :string
    add_column :photos, :architect,     :string
    add_column :photos, :building_name, :string
    add_column :photos, :address,       :string
    add_column :photos, :latitude,      :float
    add_column :photos, :longitude,     :float
    add_column :photos, :content,       :text
    add_column :photos, :ownership,     :string
    add_column :photos, :creditline,    :string
    add_column :photos, :flicker_id,    :float
    add_column :photos, :comment,       :text
  end
end
