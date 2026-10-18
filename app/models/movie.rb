class Movie < ActiveRecord::Base
  SORTABLE_COLUMNS = %w[ title rating release_date ].freeze
  SORT_DIRECTIONS = %w[ asc desc ].freeze

  # Sorting happens in the database, which is faster than sorting in Ruby
  # or the browser and keeps the logic in one place. Only whitelisted
  # columns and directions are accepted, so user input can't inject SQL.
  scope :sorted_by, ->(column, direction) {
    column = "title" unless SORTABLE_COLUMNS.include?(column)
    direction = "asc" unless SORT_DIRECTIONS.include?(direction)
    order(column => direction, id: :asc)
  }
end
