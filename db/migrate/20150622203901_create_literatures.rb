class CreateLiteratures < ActiveRecord::Migration
  def change
    create_table :literatures do |t|
      t.string :author
      t.string :title
      t.string :subtitle
      t.string :published_at
      t.string :publisher
      t.integer :year
      t.string :cover_file
      t.string :url

      t.timestamps null: false
    end
  end
end
