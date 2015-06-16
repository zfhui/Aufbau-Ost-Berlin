class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
<<<<<<< HEAD

      t.string  :name, null: false
      t.float   :longitude, default: 0.0
      t.float   :latitude, default: 0.0
      t.integer :built_from
      t.integer :built_to
      t.integer :built_from_2
      t.integer :built_to_2
      t.text    :description, default: ""
      t.string  :wiki_url, default: ""
      t.string  :wiki_common_url, default: ""
      t.string  :denkmalliste_url, default: ""
      t.string  :grossstadt_url, default: ""
      t.text    :other_urls, array: true, default: []

      t.timestamps null: false
    end
  end
end
