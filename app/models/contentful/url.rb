module Contentful
  class URL < ContentfulModel::Base
    self.content_type_id = 'url'

    belongs_to_many :buildings
  end
end
