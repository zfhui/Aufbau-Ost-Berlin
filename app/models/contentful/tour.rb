module Contentful
  class Tour < ContentfulModel::Base
    self.content_type_id = 'tour'

    has_many :buildings

    def image_path
      building = Building.find(buildings.first.id)
      building.photos.first.file.url
    end
  end
end
