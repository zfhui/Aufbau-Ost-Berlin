class AddVideoUrlToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :video_url, :string, default: ""
  end
end
