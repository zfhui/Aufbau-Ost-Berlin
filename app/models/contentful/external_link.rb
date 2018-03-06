module Contentful
  class ExternalLink < ContentfulModel::Base
    self.content_type_id = 'url'

    belongs_to_many :buildings, inverse_of: :urls
  end
end
