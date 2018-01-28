def min_path_sum(grid)
  min_sum_helper(grid, grid.length - 1, grid[0].length - 1, {})
end

def min_sum_helper(grid, rows, cols, memo)
  if rows == 0 && cols == 0
    return grid[rows][cols]
  end
  if rows < 0 || cols < 0
    return Float::INFINITY
  end

  path1_sum = memo[[rows-1, cols]] || min_sum_helper(grid, rows-1, cols, memo)
  path2_sum = memo[[rows, cols-1]] || min_sum_helper(grid, rows, cols-1, memo)

  memo[[rows, cols]] = grid[rows][cols] + min(path1_sum, path2_sum)
end

def min(x, y)
  if x < y
    return x
  else
    return y
  end
end

grid = [
 [1,3,1],
 [1,5,1],
 [4,2,1]
]

p min_path_sum(grid)
