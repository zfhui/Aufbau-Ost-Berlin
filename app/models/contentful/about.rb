module Contentful
  class About < ContentfulModel::Base
    self.content_type_id = 'about'

    has_many :section_blocks
  end
end
