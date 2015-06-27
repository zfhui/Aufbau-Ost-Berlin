class AddImagePathToTours < ActiveRecord::Migration
  def change
    add_column :tours, :image_path, :string, default: ""
  end
end
