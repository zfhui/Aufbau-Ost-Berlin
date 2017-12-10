module Contentful
  class Contributor < ContentfulModel::Base
    self.content_type_id = 'contributor'

    belongs_to_many :section_texts,
                    class_name: 'Contentful::SectionText',
                    reverse_of: :contributors


    has_many :social_medias, reverse_of: :contributors
  end
end
