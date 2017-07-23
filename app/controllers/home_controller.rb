class HomeController < ApplicationController
  def index
    @title   = Contentful::Intro.first.title
    @content = Contentful::Intro.first.content
  end

  def about
  end

  def impressum
  end

  def haftung
  end
end
