module Contentful
  class Literature < ContentfulModel::Base
    self.content_type_id = 'literature'

    has_many :books,
             inverse_of: :literatures

  end
end
