class AddFeaturesToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :architect, :string
    add_column :buildings, :architect_2, :string
    add_column :buildings, :architect_3, :string

    remove_column :buildings, :other_urls, :string
    add_column :buildings, :other_url, :string
    add_column :buildings, :other_url_2, :string

    add_column :buildings, :comments, :text
  end
end
