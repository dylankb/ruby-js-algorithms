# For any non-negative integers:

# x * y = {
#           0                  if x == 0
#           x/2 * y + y        if x is even
#           x/2 * (y + y) + y  if x is odd
#         }

# Iteration

def peasant_multiply(x, y)
  product = 0
  while x > 0
    if x.odd?
      product = product + y
    end
    x = x / 2
    y = y + y
  end

  product
end

p peasant_multiply(3,8)

# Recursion

def peasant_multiply(x, y)
  product = 0

  peasant_multiply_helper(x, y, 0)
end

def peasant_multiply_helper(x, y, product)
  return product if x == 0

  if x.odd?
    product = product + y
  end
  x = x / 2
  y = y + y

  peasant_multiply_helper(x, y, product)
end

p peasant_multiply(3,8)
