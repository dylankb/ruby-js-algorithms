# Recursive

def unique_paths(rows, columns)
  return 1 if rows == 1 || columns == 1

  unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
end

p unique_paths(3, 3)

# Recursive - Memoization
#
# paths[i][j] = paths[i][j-1] + paths[i-1][j]

def unique_paths(rows, columns)
  unique_paths_helper(rows, columns, {})
end

def unique_paths_helper(rows, columns, paths)
  # base case
  return 1 if rows == 1 || columns == 1

  if paths[[rows, columns]].nil?
    paths[[rows, columns]] = unique_paths_helper(rows - 1, columns, paths) +
                             unique_paths_helper(rows, columns - 1, paths)
  else
    paths[[rows, columns]]
  end
end

p unique_paths(3, 3)
