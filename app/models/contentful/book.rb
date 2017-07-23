module Contentful
  class Book < ContentfulModel::Base
    self.content_type_id = 'book'

    belongs_to_many :literatures,
                    class_name: 'Contentful::Literature',
                    inverse_of: :books
  end
end
