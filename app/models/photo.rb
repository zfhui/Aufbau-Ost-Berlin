class Photo < ActiveRecord::Base
  belongs_to :building

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Photo.create! row.to_hash
    end
  end

  def path
    "http://zfhui.de/others/Zuschnitte/#{index_card_no}_#{photo_no}.jpg"
  end

end
