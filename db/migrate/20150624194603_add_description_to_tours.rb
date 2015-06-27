class AddDescriptionToTours < ActiveRecord::Migration
  def change
    add_column :tours, :description, :text, default: ""
  end
end
