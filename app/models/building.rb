class Building < ActiveRecord::Base
  has_many :photos
  belongs_to :tour

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

  # quik and dirty helpers

  def built_dates_str
    first = "#{built_from}-#{built_to}"

    if built_from_2
      return "#{first}; #{built_from_2}-#{built_to_2}"
    end

    first
  end

  def architects_str
    first = architect

    if architect_2
      if !architect_2.empty?
        second =  "#{first}; #{architect_2}"

        if architect_3
          if !architect_3.empty?
            third = "#{second}; #{architect_3}"
            return third
          end
        end

      end

      return second
    end

    first
  end

  def description_short
    description.truncate(90, seperator: /\w/)
  end
end
