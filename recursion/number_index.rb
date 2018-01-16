def number_search(array, target)
  number_search_helper(array, 0, target)
end

def number_search_helper(array, index, target)
  # base case - failure
  return -1 if index == array.size
  # base case - success
  return index if target == array[index]

  number_search_helper(array, index + 1, target)
end

p number_search([1,2,3,4,3,8,1], 8) == 5
p number_search([2,1], 1) == 1
p number_search([2], 2) == 0
p number_search([2], 3) == -1
