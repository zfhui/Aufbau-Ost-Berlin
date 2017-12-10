module Contentful
  class About < ContentfulModel::Base
    self.content_type_id = 'about'

    has_many :section_blocks, inverse_of: :abouts
  end
end
