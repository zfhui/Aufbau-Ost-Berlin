module Contentful
  class SectionText < ContentfulModel::Base
    self.content_type_id = 'sectionText'

    belongs_to_many :section_blocks
  end
end
