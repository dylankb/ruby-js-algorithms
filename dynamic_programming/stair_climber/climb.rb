# Memoization w/ helper method

def climb(stair_count)
  climb_helper(stair_count, {})
end

def climb_helper(stair_count, cache)
  return 1 if stair_count == 0 || stair_count == 1

  result = cache[stair_count-1] || climb_helper(stair_count-1, cache) +
           cache[stair_count-2] || climb_helper(stair_count-2, cache)

  cache[stair_count] = result]
  result
end

p climb(4) == 5

# Memoization w/ no helper. Less efficient since we cash every number -
# (requires more stacks)

def climb(n, cache)
  return cache[n] if cache[n]

  cache[n] = climb(n-1, cache) + climb(n-2, cache)
end

cache = [1, 1]
p climb(4, cache) == 5
