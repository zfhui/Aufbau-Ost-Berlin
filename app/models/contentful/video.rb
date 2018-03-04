module Contentful
  class Video < ContentfulModel::Base
    self.content_type_id = 'video'

    belongs_to_many :buildings
  end
end
