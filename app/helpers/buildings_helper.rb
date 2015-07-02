module BuildingsHelper
  def external_urls_to_str (building)
    urls = ""
    if building.wiki_url.present?
      urls << content_tag(:a, "Wikipedia", href: "#{building.wiki_url}", target: "_blank", class: "external_urls")
    end

    if building.wiki_common_url.present?
      urls << ', ' unless urls.empty?
      urls << content_tag(:a, "Wikipedia Common", href: "#{building.wiki_common_url}", target: "_blank", class: "external_urls")
    end

    if building.grossstadt_url.present?
      urls << ', ' unless urls.empty?
      urls << content_tag(:a, "Großstadtgeschichten", href: "#{building.grossstadt_url}", target: "_blank", class: "external_urls")
    end

    if building.denkmalliste_url.present?
      urls << ', ' unless urls.empty?
      urls << content_tag(:a, "Denkmalliste", href: "#{building.denkmalliste_url}", target: "_blank", class: "external_urls")
    end

    if building.other_url.present?
      urls << ', ' unless urls.empty?
      urls << content_tag(:a, "Link 1", href: "#{building.other_url}", target: "_blank", class: "external_urls")
    end

    if building.other_url_2.present?
      urls << ', ' unless urls.empty?
      urls << content_tag(:a, "Link 2", href: "#{building.other_url_2}", target: "_blank", class: "external_urls")
    end

    return urls.html_safe
  end

  def built_dates_to_str (building)
    dates = ""

    if building.built_from.present?
      dates << "#{building.built_from}"
    end

    if building.built_to.present?
      dates << '-' << "#{building.built_to}"
    end

    if building.built_from_2.present?
      dates << '; ' unless dates.empty?
      dates << "#{building.built_from_2}"
    end

    if building.built_to_2.present?
      dates << '-' << "#{building.built_to_2}"
    end

    return dates
  end

  def architects_to_str (building)
    architects = ""

    if building.architect.present?
      architects << building.architect
    end

    if building.architect_2.present?
      architects << '; ' unless architects.empty?
      architects << building.architect_2
    end

    if building.architect_3.present?
      architects << '; ' unless architects.empty?
      architects << building.architect_3
    end

    return architects
  end


  def next_building(id)
    Building.where("id > ?", id).order("name ASC").first || Building.first
  end

  def prev_building(id)
    Building.where("id < ?", id).order("name DESC").first || Building.last
  end

end
