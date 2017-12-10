class HomeController < ApplicationController
  def index
    @title   = Contentful::Intro.first.title
    @content = Contentful::Intro.first.content
  end

  def about
    about           = Contentful::About.first
    @title          = about.title
    @section_blocks = about.section_blocks
  end

  def impressum
  end

  def haftung
  end
end
