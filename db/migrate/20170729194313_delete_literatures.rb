class DeleteLiteratures < ActiveRecord::Migration
  def change
    drop_table :literatures
  end
end
