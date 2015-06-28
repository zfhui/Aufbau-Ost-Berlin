class AddCommentsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :comments, :text, default: "", nil: false
  end
end
