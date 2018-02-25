module Contentful
  class Building < ContentfulModel::Base
    self.content_type_id = 'building'

    has_many :architects
    has_many :urls, template: :urls
  end
end
