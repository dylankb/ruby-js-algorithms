# Basic memoization example

def fibonacci(num)
  fibs = [0,1] # cache of values - at index 0 return value 0, etc.
  (2..num).each do |i|
    fibs[i] = fibs[i-1] + fibs[i-2]
  end
  fibs[num]
end

p fibonacci(3) == 2

# Computations are stored, so calls run in constant time - O(N). But you
# Should not use an array where is N is very large, though.

# Iteration example, except we updated existing pointers in each loop which
# should(?) be the same as the above caching method for runtime, except with a
# lower memory usage.

def fibonacci(num)
  previous, current = 0, 1
  (2..num).each do |i|
    previous, current = current, current + previous # simultaneous assignment
  end
  return current
end

p fibonacci(4) == 3

# The less clever, easier to read version

def fibonacci(num)
  previous, current = 0, 1
  (2..num).each do |i|
    nexxt = previous + current
    previous = current
    current = nexxt
  end
  return current
end

p fibonacci(5) == 5

# Of course we can apply memoization to the more traditional recursive solution.

def fibonacci(num)
  fibonacci_helper(num, [])
end

def fibonacci_helper(num, cache)
  return num if num < 2

  return (cache[num-1] || fibonacci(num-1)) +
         (cache[num-2] || fibonacci(num-2))
end

p fibonacci(6) == 8
