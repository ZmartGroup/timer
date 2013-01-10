module ApplicationHelper

  def menu_li name, path
    css = current_page?(path) ? "active" : ""
    content_tag(:li, link_to(name, path),  :class => css)
  end
end
