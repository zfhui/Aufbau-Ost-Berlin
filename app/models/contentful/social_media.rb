module Contentful
  class SocialMedia < ContentfulModel::Base
    self.content_type_id = 'socialMedia'

    belongs_to_many :contributors,
                    class_name: 'Contentful::Contributor',
                    reverse_of: :social_medias
  end
end
