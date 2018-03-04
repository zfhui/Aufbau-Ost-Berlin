class ApplicationController < ActionController::Base
  helper ContentfulRails::MarkdownHelper

  protect_from_forgery with: :exception
end
