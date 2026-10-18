module MoviesHelper
  RATINGS = %w[ G PG PG-13 R NC-17 ].freeze

  # Column header link that sorts the movies table by `column`.
  # Clicking the currently sorted column flips its direction.
  def sortable_header(column, label)
    sorted = column == sort_column
    direction = sorted && sort_direction == "asc" ? "desc" : "asc"

    # The arrow is a visual cue; the hidden text lets screen readers
    # announce the sort without relying on color.
    indicator = if sorted
      safe_join([
        tag.span(sort_direction == "asc" ? "↑" : "↓", class: "sort-indicator", "aria-hidden": true),
        tag.span("(sorted #{sort_direction_label})", class: "visually-hidden")
      ])
    else
      tag.span("↕", class: "sort-indicator", "aria-hidden": true)
    end

    tag.th(scope: "col", class: sorted_class(column),
           "aria-sort": (sorted ? sort_direction_label : "none")) do
      link_to movies_path(sort: column, direction: direction), class: "sort-link" do
        safe_join([ label, " ", indicator ])
      end
    end
  end

  # Classes for the currently sorted column. The direction class gives
  # ascending and descending sorts different highlight colors.
  def sorted_class(column)
    "sorted sorted-#{sort_direction}" if column == sort_column
  end

  def sort_direction_label
    sort_direction == "asc" ? "ascending" : "descending"
  end

  def formatted_release_date(movie)
    movie.release_date&.strftime("%b %-d, %Y")
  end
end
