module Contentful
  class Architect < ContentfulModel::Base
    self.content_type_id = 'architect'

    belongs_to_many :buildings
  end
end
