module Contentful
  class SectionText < ContentfulModel::Base
    self.content_type_id = 'sectionText'

    belongs_to_many :section_blocks,
                    class_name: 'Contentful::SectionBlock',
                    reverse_of: :section_texts

    has_many :contributors, reverse_of: :section_blocks
  end
end
