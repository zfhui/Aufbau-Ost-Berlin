module Contentful
  class SectionBlock < ContentfulModel::Base
    self.content_type_id = 'sectionBlock'

    belongs_to_many :abouts,
                    class_name: 'Contentful::About',
                    reverse_of: :section_blocks

    has_many :section_texts, reverse_of: :section_blocks
  end
end
