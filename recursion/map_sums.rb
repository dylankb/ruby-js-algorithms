# Map previous array sums so that each sum is the next accumulated total
# map_sums([1,2,3,4,5,6]) => [1,3,6,10,15,21]

# Approach 1: Recursion confusions

# I'm leaving these here just to document my confusions with recursion.

def map_sums(array)
  sum = 0
  map_sums_helper(array, 0, sum)
end

def map_sums_helper(array, index)
  array[index] = map_sums_helper(array, index) + map_sums_helper(array, index + 1)

  if index == 0
    array[index] = array[index]
    return array[index]
  end

  array[index]
end

p map_sums([1,2,3,4,5,6])


def map_sums_helper(array, index, sum)
  return array if index == array.size

  array[0] += sum

  map_sums_helper(array, index - 1, sum)
end

def map_sums_helper(array, index, sum)
  return if index <= 1

  map_sums_helper(array, index - 1, sum)

  array[index-1] += array[index-2]

  array
end

p map_sums([1,2,3,4,5,6])

# Approach 2: Recursive iteration - iteration starts from then end of the array

# It seems like often you can create simpler base conditions when iterating
# from the end of the array.

def map_sums(array) # returns array
  return [] if array.size == 0
  return array[0] if array.size == 1

  map_sums_helper(array, array.size-1)

  array
end

def map_sums_helper(array, index) # returns number
  return array[index] if index == 0

  array[index] = array[index] + map_sums_helper(array, index - 1)
end
#
p map_sums([1,2,3,4,5,6])

# Approach 3. - Recursive iteration from end of array

# This approach was initially a flawed because I was making a pretty big
# iteration error - modifying my collection while iterating. Essentially I was
# "backtracking" to try to compute the sum of the all index values 0...index
# using previously modified sums. For example:

# map_sums([1,2,3]) iterations
# 1. index = 0 => [1,3,3]
# 2. index = 2 => [1,3,3]
# 3. index = 3 => [1,3,7]

# The problem in the third iteration happens when I try to sum 1+3 (the
# previous two values) + 3, which returns 7. I actually want to be summing 1+2+3
# but since I have modified a previous field this would not work. The solution
# was to create a duplicate array that was read only.

def map_sums(array) # returns array
  return [] if array.size == 0
  return array[0] if array.size == 1

  map_sums_helper!(array, array.dup, 0)
  array
end

def map_sums_reverse_helper(array, array_dup, index)
  return array[index] if index == 0
  array_dup[index] + map_sums_reverse_helper(array, array_dup, index - 1)
end

def map_sums_helper!(array, array_dup, index) # no return value
  return if index == array.size

  previous_value = map_sums_reverse_helper(array, array_dup, index)
  array[index] = previous_value

  map_sums_helper!(array, array_dup, index + 1)
end

p map_sums([1,2,3,4,5,6]) == [1, 3, 6, 10, 15, 21]

# Approach 4. Recursive iteration from start of the array.

# I did not need recursion to "look behind" to try and find the previous sums at
# all. Since I am updating the current value with the current + previous, my
# previous value (array[index-1]) is the "cache" or store of all values from the
# current 0..index.

def map_sums(array) # returns array
  return [] if array.size == 0
  return array if array.size == 1

  new_array = map_sums_helper(array, 1)
end

def map_sums_helper(array, index) # return array
  return array if index == array.size

  array[index] = array[index] + array[index-1]

  map_sums_helper(array, index + 1)
end

p map_sums([1,2,3,4,5,6]) == [1, 3, 6, 10, 15, 21]
