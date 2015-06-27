class ChangeFeaturesInPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :architect,  :string
    rename_column :photos, :type,       :classification
    remove_column :photos, :flicker_id
    add_column    :photos, :flickr_url, :string
    add_column    :photos, :comments,   :text
    add_column    :photos, :keywords,   :text
  end
end
