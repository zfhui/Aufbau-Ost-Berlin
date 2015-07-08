class CreateIndexCards < ActiveRecord::Migration
  def change
    create_table :index_cards do |t|
      t.string :photographer, default: "", null: false
      t.text :architect, default: "", null: false
      t.string :building_name, default: "", null: false
      t.string :place, default: "", null: false
      t.string :systematic, default: ""
      t.string :ownership, default: ""
      t.string :filename, default: "", null: false
      t.integer :no_of_photos, default: 0
      t.string :inventory_date, null: false
      t.string :creditline, default: "", null: false
      t.text :content, default: ""
      t.integer :year_taken
      t.string :original_filename, default: "", null: false
      t.string :flickr_name, null: false
      t.string :url_t, default: "", null: false
      t.string :url_s, default: "", null: false
      t.string :url_sq, default: "", null: false
      t.string :url_m, default: "", null: false
      t.string :url_o, default: "", null: false
      t.string :pathalias, default: "", null: false
      t.integer :title, null: false

      t.timestamps null: false
    end
  end
end
