module Contentful
  class Building < ContentfulModel::Base
    self.content_type_id = 'building'

    has_many :architects
    has_many :urls, class_name: 'Contentful::ExternalLink', inverse_of: :buildings
    has_many :videos
  end
end
