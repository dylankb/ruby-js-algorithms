# # # https://leetcode.com/problems/search-insert-position/description/

# Assumes that the value is not present in the array and there are no duplicates

# Time: O(log N)

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
#
p find_insert_position([], 1)                           # 0
p find_insert_position([1,3,7,9,11,13,17,18,20],4)      # 2
p find_insert_position([1,3,7,9,11,13,17,18,20], 12)    # 5
p find_insert_position([1,3,5,6],2)                     # 1
p find_insert_position([1,3,5,6],0)                     # 0

def find_insert_position(nums, target)
  return 0 if nums.length == 0

  search_result = nums.length > 1 ? binary_search(nums, target) : 0

  nums[search_result] > target ? search_result : search_result + 1
end

def binary_search(nums, target)
  low = 0
  high = nums.length - 1

  while low <= high
    midpoint = (low + high) / 2
    guess = nums[midpoint]

    if guess == target
      return guess
    elsif guess > target
      high = midpoint - 1
    else
      low = midpoint + 1
    end
  end

  return midpoint
end

p find_insert_position([], 1)                           # 0
p find_insert_position([1,3,7,9,11,13,17,18,20],4)      # 2
p find_insert_position([1,3,7,9,11,13,17,18,20], 12)    # 5
p find_insert_position([1,3,5,6],2)                     # 1
p find_insert_position([1,3,5,6],0)                     # 0

# nums[search_result] > target ? search_result : search_result + 1 may seem odd but when you think through the example of inputs it's a bit more clear. If our nums are [1,3,4] and the target is 2, I can't tell of the top of my head exactly what index a binary search would return, but I know that it should either be  0 (value 1) or 1 (value 3). If search_result equals index of 1, then nums[search_result] > target resolves to true (3 > 2) so we can just search_result because we would want the array to look like [1,2,3,4] after the insertion. If search_result is 0, then nums[search_result] > target resolves to false (1 > 2). Therefore we should return search_result + 1
