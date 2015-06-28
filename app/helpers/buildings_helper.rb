module BuildingsHelper
  def url_html (link, name)
    if link
      if !link.empty?
        content_tag(:a, "#{name}", href: "#{link}", target: "_blank", class: "external_links")
      end
    end
  end

  def next_building(id)
    Building.where("id > ?", id).order("name ASC").first || Building.first
  end

  def prev_building(id)
    Building.where("id < ?", id).order("name DESC").first || Building.last
  end

end
