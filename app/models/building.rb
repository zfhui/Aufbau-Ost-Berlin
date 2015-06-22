class Building < ActiveRecord::Base
  has_many :photos
  belongs_to :tour

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Building.create! row.to_hash
    end
  end

end
