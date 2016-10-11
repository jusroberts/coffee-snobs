module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = column == valid_sort_column ? "current #{sort_direction}" : nil
        direction = column == valid_sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end

    def valid_sort_column
      valid_fields = Bean.columns
      valid_fields << "average_rating"
      valid_fields.include?(params[:sort]) ? params[:sort] : "name"
    end
end
