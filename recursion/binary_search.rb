def binary_search(array, target)
  midpoint = array.size / 2
  lower_bound = 0
  upper_bound = array.size - 1
  binary_search_helper(array, target, lower_bound, upper_bound, midpoint)
end

def binary_search_helper(array, target, lower_bound, upper_bound, midpoint)
  # base case - success
  return midpoint if array[midpoint] == target

  # base case - final check
  if lower_bound + 1 == upper_bound
    if array[lower_bound] == target
      return lower_bound
    elsif array[upper_bound] == target
      return upper_bound
    else
      return -1
    end
  end

  # create smaller problem
  if array[midpoint] > target
    upper_bound = midpoint
  else
    lower_bound = midpoint
  end

  midpoint = (lower_bound + upper_bound) / 2

  binary_search_helper(array, target, lower_bound, upper_bound, midpoint)
end

p binary_search([1,2,3,4,5], 2) == 1
p binary_search([1,2,3,4,5], 3) == 2
p binary_search([1,2,3,4,5], 5) == 4
