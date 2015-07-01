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

  def next_building(id)
    Building.where("id > ?", id).order("name ASC").first || Building.first
  end

  def prev_building(id)
    Building.where("id < ?", id).order("name DESC").first || Building.last
  end

end
