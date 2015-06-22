class CreateToursAndAddTourIdToBuildings < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name

      t.timestamps null: false
    end

    add_column :buildings, :tour_id, :integer, index: true

  end
end
