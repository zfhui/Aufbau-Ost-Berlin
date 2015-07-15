class Building < ActiveRecord::Base
  has_many :photos
  belongs_to :tour

  default_scope { order('name ASC') }

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.street_name  = geo.route
      obj.house_no = geo.street_number
      obj.zipcode = geo.postal_code
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end
  after_validation :reverse_geocode # auto-fetch address

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Building.create! row.to_hash
    end
  end
end
