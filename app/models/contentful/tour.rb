module Contentful
  class Tour < ContentfulModel::Base
    self.content_type_id = 'tour'

    has_many :buildings
  end
end
