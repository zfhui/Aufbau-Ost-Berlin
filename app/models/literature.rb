class Literature < ActiveRecord::Base
  default_scope { order('title ASC') }

end
