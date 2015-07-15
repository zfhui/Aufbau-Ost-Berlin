class IndexCard < ActiveRecord::Base
  default_scope { order('title ASC') }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      IndexCard.create! row.to_hash
    end
  end

end
