# Mental Model 1:

# What's the minimum path sum from the top element to a given element? Then the oeveral solution n:

# MIN{f(A.size1, i), where i => 0... A.size-1}
# ---
#
# Mental Model 2: Bottom down
#
# f(m, n): What's the minimum path to the bottom, from an element (any) A[m][n]? Then the overall solution is f(0,0)

# [m, n] [m+1, n], [m+1, n+1]

# [
#      [2],
#     [3,4],
#    [6,5,7],
#   [4,1,8,3]
# ]
#
# Simplest question example: From [1,0] (6), what's the minimum sum path to the bottom?
#
# Minimum(4,1) + 6
#
# reduction:
# f(m, n) = MIN{f(m+1, n), f(m+1, n+1)} + A[m][n]
#
# When should this algorithm end? If you're starting from the bottom, we should
# stop processing when we have reached the top.
#
# base case:
# f(m, n) = A[m][n] if m == A.size-1
#

def minimum_total(triangle)
  # Start from the bottom left of the triangle
  minimum_total_helper(triangle, 0, 0)
end

def minimum_total_helper(triangle, row, col)
  # base case - return the value for the top triangle point when you reach it
  require 'pry'; binding.pry
  return triangle[row][col] if row == triangle.size-1

  left_sum = minimum_total_helper(triangle, row+1, col)
  right_sum = minimum_total_helper(triangle, row+1, col+1)

  return [left_sum, right_sum].min + triangle[row][col]
end

triangle=[
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]

p minimum_total(triangle)

# def minimum_total(triangle)
#   minimum_total_helper(triangle, triangle.length - 1, triangle[0].length - 1, {})
# end
#
# def minimum_total_helper(triangle, rows, cols, memo)
#
#   if rows == 0 && cols == 0
#     return triangle[rows][cols]
#   end
#   if rows < 0 || cols < 0
#     return Float::INFINITY
#   end
#
#   paths = []
#   row_cols = 0
#   temp_row = row
#   while row_cols <= triangle[rows][cols].size-1
#     path = minimum_total_helper(triangle, rows-1, cols, memo)
#     paths << path
#     row_cols += 1
#   end
#
#   minimum_path = paths.min
#
#   memo[[rows, cols]] = triangle[rows][cols] + minimum_path
# end
#
# def min(x, y)
#   if x < y
#     return x
#   else
#     return y
#   end
# end
#
# triangle=[
#      [2],
#     [3,4],
#    [6,5,7],
#   [4,1,8,3]
# ]


# p minimum_total(triangle)
