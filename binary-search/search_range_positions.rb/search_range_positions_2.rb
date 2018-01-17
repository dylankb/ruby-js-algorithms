# https://leetcode.com/problems/search-for-a-range/description/

def find_position_ranges_for_value(array, target)
  return [-1, -1] if array.empty? || target_outside_range(array, target)

  coordinates = []
  lower_bound_range = binary_search_lower_bound(array, target)
  upper_bound_range = binary_search_upper_bound(array, target)

  coordinates << lower_bound_range
  coordinates << upper_bound_range

  coordinates
end

def binary_search_lower_bound(array, target)
  left = 0
  right = array.size - 1
  last_found_index = -1

  while left <= right
    mid = left + (right - left) / 2

    if array[mid] == target
      last_found_index = mid
      right = mid - 1
    elsif array[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  last_found_index
end

def binary_search_upper_bound(array, target)
  left = 0
  right = array.size - 1
  last_found_index = -1

  while left <= right
    mid = left + (right - left) / 2

    if array[mid] == target
      last_found_index = mid
      left = mid + 1
    elsif array[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  last_found_index
end

def target_outside_range(array, target)
  array[0] > target || array[-1] < target
end

p binary_search_lower_bound([1, 2, 5, 6, 7], 7) == 4
p binary_search_lower_bound([1, 2, 5, 7, 7], 7) == 3
p binary_search_upper_bound([1, 2, 5, 7, 7], 7) == 4

p find_position_ranges_for_value([1, 2, 5, 7, 7], 7) == [3, 4]
p find_position_ranges_for_value([1, 2, 5, 7, 7, 7], 7) == [3, 5]
p find_position_ranges_for_value([1, 2, 5, 7, 7, 7], 9) == [-1, -1]
p find_position_ranges_for_value([1, 5], 4) == [-1, -1]
