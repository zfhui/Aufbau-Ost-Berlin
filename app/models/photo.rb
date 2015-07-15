class Photo < ActiveRecord::Base
  belongs_to :building
  before_create :set_building!

  default_scope { order('index_card_no ASC, photo_no ASC') }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Photo.create! row.to_hash
    end
  end

  def path
    "http://zfhui.de/others/Zuschnitte/#{index_card_no}_#{photo_no}.jpg"
  end

  def path_150px
    "http://zfhui.de/others/Zuschnitte/150/#{index_card_no}_#{photo_no}.jpg"
  end

  def path_250px
    "http://zfhui.de/others/Zuschnitte/250/#{index_card_no}_#{photo_no}.jpg"
  end

end

  def set_building!
    b = Building.where(name: self.building_name).first
    self.building_id =
      if b
        b.id
      else
        0
      end
  end
