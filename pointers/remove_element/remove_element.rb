# https://leetcode.com/problems/remove-element/description/

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
