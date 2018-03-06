module Contentful
  class SectionBlock < ContentfulModel::Base
    self.content_type_id = 'sectionBlock'

    has_many :section_texts
  end
end
