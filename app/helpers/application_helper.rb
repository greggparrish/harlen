module ApplicationHelper
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
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => 'nav-item '+class_name) do
      link_to link_text, link_path, class: 'nav-link'
    end
  end
end
