module MoviesHelper
  RATINGS = %w[ G PG PG-13 R NC-17 ].freeze

  # Column header link that sorts the movies table by `column`.
  # Clicking the currently sorted column flips its direction.
  def sortable_header(column, label)
    sorted = column == sort_column
    direction = sorted && sort_direction == "asc" ? "desc" : "asc"
    indicator = if sorted
      sort_direction == "asc" ? "↑" : "↓"
    else
      "↕"
    end

    tag.th(scope: "col", class: ("sorted" if sorted),
           "aria-sort": (sorted ? "#{sort_direction}ending" : "none")) do
      link_to movies_path(sort: column, direction: direction), class: "sort-link" do
        safe_join([ label, " ", tag.span(indicator, class: "sort-indicator", "aria-hidden": true) ])
      end
    end
  end

  # Adds the "sorted" class to table cells in the currently sorted column.
  def sorted_class(column)
    "sorted" if column == sort_column
  end

  def formatted_release_date(movie)
    movie.release_date&.strftime("%b %-d, %Y")
  end
end
