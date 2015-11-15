# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "#{ENV.fetch('HOST_URL')}"

SitemapGenerator::Sitemap.public_path = '/tmp'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new

SitemapGenerator::Sitemap.sitemap_host = "http://#{ENV.fetch('FOG_DIRECTORY')}.s3.amazonaws.com/"

SitemapGenerator::Sitemap.sitemap_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host

  Building.all.each do |building|
    add building_path(building),
        priority:   0.7,
        changefreq: 'monthly',
        lastmod:    building.updated_at
  end

  Tour.all.each do |tour|
    add tour_path(tour),
        priority:   0.7,
        changefreq: 'monthly',
        lastmod:    tour.updated_at
  end

  Literature.all.each do |literature|
    add literature_path(literature),
        priority:   0.5,
        changefreq: 'monthly',
        lastmod:    literature.updated_at
  end

  add about_path,     priority: 0.7, changefreq: 'monthly'
  add impressum_path, priority: 0.1, changefreq: 'yearly'
  add haftung_path,   priority: 0.1, changefreq: 'yearly'

end
