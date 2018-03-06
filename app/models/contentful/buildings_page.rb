module Contentful
  class BuildingsPage < ContentfulModel::Base
    self.content_type_id = 'buildings_page'

    has_many :buildings
  end
end
