# https://leetcode.com/problems/remove-element/description/

# Directly remove duplicate

# Time: O(N^2) - We have to shift all the elements of the array down white it's removed
# Space: O(1)

def remove_element(nums, val)
  index = 0
  current_element = nums[index]
  while current_element
    if current_element == val
      nums.delete_at index
    else
      index += 1
    end
    current_element = nums[index]
  end

  nums
end
