def find_insert_position(array, target)
  # Value should be inserted at 0 if the array is empty
  return 0 if array.empty?

  # If the values is greater than the greatest value,
  # it should at the index following the last (greatest) value.
  # Likewise if it is less than all other values
  if target > array[-1]
    return array.size
  elsif target < array[0]
     return 0
  end

  binary_search_for_position(array, target)
end

def binary_search_for_position(array, target)
  lower_bound = 0
  upper_bound = array.size - 1

  while lower_bound + 1 < upper_bound
    mid = lower_bound + (upper_bound - lower_bound) / 2

    if array[mid] == target
      return mid
    elsif array[mid] > target
      upper_bound = mid
    else
      lower_bound = mid
    end
  end

  if array[lower_bound] == target
    return lower_bound
  end
  if array[upper_bound] == target
    return upper_bound
  end

  # If we have reached this point in the code, we have have two adjacent indices
  # with no match. The values at these two points therefore cover the target value.
  lower_bound + 1
end

# p find_insert_position([1,3,7,9,11,13,17,18,20],4)
# p find_insert_position([1,3,7,9,11,13,17,18,20],12)
# p find_insert_position([1,3,5,6],2)
p find_insert_position([1,3,5,6],0)
# p binary_search([1, 3, 5, 6, 9, 10, 12, 14, 17, 18], 2)
