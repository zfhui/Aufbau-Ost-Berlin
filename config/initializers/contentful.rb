ContentfulRails.configure do |config|
  config.access_token         = ENV.fetch('CONTENTFUL_ACCESS_TOKEN')
  config.preview_access_token = ENV.fetch('CONTENTFUL_PREVIEW_ACCESS_TOKEN')
  config.management_token     = ENV.fetch('CONTENTFUL_MANAGEMENT_TOKEN')
  config.default_locale       = ENV.fetch('CONTENTFUL_DEFAULT_LOCALE')
  config.space                = ENV.fetch('CONTENTFUL_SPACE')
end
