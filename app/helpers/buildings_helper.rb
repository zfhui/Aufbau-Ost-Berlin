module BuildingsHelper
  def external_urls_to_str (building)
    remap_urls =
      building.urls.map do |url|
        content_tag(:a, url.name, href: "#{url.url}", target: '_blank', class: 'external_urls')
      end

    remap_urls.join(', ').html_safe
  end

  def built_dates_to_str(building)
    building.construction_period.present? ? building.construction_period.join(', ') : 'N.N.'
  end

  def architects_to_str(building)
    building.architects.present? ? building.architects.map(&:name).join(', ') : 'N.N.'
  end

  def next_building(id)
    @sorted_buildings = Contentful::Building.all.load.sort_by { |building| building.name }
    index = @sorted_buildings.index { |building| building.id == id }
    if index == @sorted_buildings.size - 1
      @sorted_buildings.first
    else
      @sorted_buildings[index += 1]
    end
  end

  def prev_building(id)
    @sorted_buildings = Contentful::Building.all.load.sort_by { |building| building.name }
    index = @sorted_buildings.index { |building| building.id == id }
    if index.zero?
      @sorted_buildings.last
    else
      @sorted_buildings[index -= 1]
    end
  end
end
