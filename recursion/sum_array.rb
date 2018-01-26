# Approach 1: Return modified object where reference is passed into each recursive call.

def sum_array(array)
  sum = {value: 0}
  sum_array_helper(array, 0, sum)

  sum
end

def sum_array_helper(array, index, sum)
  return if array[index+1].nil?

  sum[:value] += array[index]

  sum_array_helper(array, index + 1, sum)
end

p sum_array([1,2,3,4,5,6])

# Approach 2: Rely on return value of method

def sum_array(array)
  sum = 0
  sum_array_helper(array, 0, sum)
end

def sum_array_helper(array, index, sum)
  return sum if array[index+1].nil?

  sum += array[index]

  sum_array_helper(array, index + 1, sum)
end

p sum_array([1,2,3,4,5,6])
