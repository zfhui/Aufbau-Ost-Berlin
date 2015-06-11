class Photo < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Photo.create! row.to_hash
    end
  end

end
