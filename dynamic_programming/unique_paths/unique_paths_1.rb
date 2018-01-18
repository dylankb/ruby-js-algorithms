# grid

# [
#   [0,1,2,3],
#   []
# ]

def unique_paths(grid, rows, columns)
  row = rows - 1
  column = columns - 1

  unique_paths_helper(grid, row, column)
end

def unique_paths_helper(grid, row, column)
  return 0 if !validSquare?(grid, row, column)
  return 1 if isDestination?(grid, row, column)

  first = unique_paths_helper(grid, row + 1, column)

  second = unique_paths_helper(grid, row, column + 1)
  first + second
end

def validSquare?(grid, row, column)
  return false if grid[row].nil? || grid[row][column].nil?
  true
end

def isDestination?(grid, row, column)
  max_columns = grid.size - 1
  max_rows = grid[0].size - 1
  row == max_rows && column == max_columns
end

def create_grid(rows, columns)
  Array.new(rows, (0..columns - 1).to_a)
end

# p unique_paths(create_grid(4, 4), 0, 0)
p unique_paths(create_grid(2, 2), 0, 0)
