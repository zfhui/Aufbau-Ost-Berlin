class AddVideoDescriptionToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :video_description, :text, default: "", nil: false
  end
end
