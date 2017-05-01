module ApplicationHelper
  include Twitter::Autolink
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "HARLEN COLLECTION"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Highlight current page in nav
  def nav_link(link_text, link_path)
    class_name = 'active' if request.url.include?(link_path)
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, class: 'nav-link'
    end
  end

  # get first para of article
  def excerpt(t)
    Nokogiri::HTML.parse(t).css('p').first.text
  end

  # get story article tags
  def get_tags(t)
    t.map(&:name.downcase).join(' ')
  end
end
