class Building < ActiveRecord::Base
  has_many :photos

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Building.create! row.to_hash
    end
  end

end
