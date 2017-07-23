class LiteraturesController < ApplicationController
  def index
    @literature = Contentful::Literature.first
  end
end
