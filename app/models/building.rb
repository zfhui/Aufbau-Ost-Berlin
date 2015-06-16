class Building < ActiveRecord::Base
<<<<<<< HEAD
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Building.create! row.to_hash
    end
  end
=======
>>>>>>> b99882b42fcfa3b0869df21e387ab551b50f5b5c
end
