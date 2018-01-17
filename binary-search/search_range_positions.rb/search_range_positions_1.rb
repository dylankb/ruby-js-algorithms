# https://leetcode.com/problems/search-for-a-range/description/

def find_value_position_ranges(array, target)
  return [-1, -1] if array.empty? || target_outside_range(array, target)

  coordinates = []
  first = binary_search(array, target, 'first')
  last = binary_search(array, target, 'last')

  coordinates << first unless first == [-1, -1]
  coordinates << last unless last == [-1, -1]
  coordinates.empty? ? [-1, -1] : coordinates
end

def binary_search(array, target, search_option)
  left = 0
  right = array.size - 1
  last_found_index = [-1, -1]

  while left <= right
    mid = left + (right - left) / 2

    if array[mid] == target

      last_found_index = mid
      if search_option == "first"
        right = mid - 1
      elsif search_option == "last"
        left = mid + 1
      end
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

# p binary_search([1, 2, 5, 6, 7], 7, 'first')
# p binary_search([1, 2, 5, 7, 7], 7, 'first')
# p binary_search([1, 2, 5, 7, 7], 7, 'last')
#
p find_value_position_ranges([1, 2, 5, 7, 7], 7) # [3, 4]
p find_value_position_ranges([1, 2, 5, 7, 7, 7], 7) # [3, 4]
p find_value_position_ranges([1, 2, 5, 7, 7, 7], 9) # [-1, -1]
# p find_value_position_ranges([1,5], 4) # [3, 4]
# p binary_search([1, 3, 5, 6, 9, 10, 12, 14, 17, 18], 2)
