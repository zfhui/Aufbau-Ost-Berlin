class Tour < ActiveRecord::Base
  has_many :buildings

  default_scope { order('name ASC') }
end
