class Building < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Building.create! row.to_hash
    end
  end
end
