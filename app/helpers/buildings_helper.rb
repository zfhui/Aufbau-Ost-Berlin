module BuildingsHelper
  def url_html (link, name)
    if link
      if !link.empty?
        "<a href='#{link}' target='_blank'>#{name}</a> |".html_safe
      end
    end
  end
end
