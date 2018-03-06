module Contentful
  class ToursPage < ContentfulModel::Base
    self.content_type_id = 'tours_page'

    has_many :tours, class_name: 'Contentful::Tour'
  end
end
