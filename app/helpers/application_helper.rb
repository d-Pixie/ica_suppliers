module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  def print_data(title, data)
    if data.present?
      content_tag(:div, content_tag(:span, title, :class => "label bold") + content_tag(:span, data, :class => "field-data"), :class => "field")
    else
      content_tag(:div, content_tag(:span, title, :class => "label bold") + content_tag(:span, "uppgift saknas", :class => "field-data uppgift_saknas"), :class => "field")
    end
  end
end
