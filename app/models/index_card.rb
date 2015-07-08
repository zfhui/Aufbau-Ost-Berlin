class IndexCard < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      IndexCard.create! row.to_hash
    end
  end

end
