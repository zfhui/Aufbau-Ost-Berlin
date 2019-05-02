module Contentful
  class Building < ContentfulModel::Base
    self.content_type_id = 'building'

    has_many :architects
    has_many :urls, class_name: 'Contentful::ExternalLink', inverse_of: :buildings
    has_many :videos

    def photos
      self.try(:gallery).try(:photos)
    end

    def image_path
      return unless photos
      photos.first.file.url
    end

    def pdf_path
      try(:pdfFile).try(:file).try(:url)
    end

    def longitude
      location['lon']
    end

    def latitude
      location['lat']
    end
  end
end
