# https://leetcode.com/problems/remove-duplicates-from-sorted-array/

# Remove in place

# Time: O(N^2) - We have to shift all the elements of the array down while it's removed
# Space: O(1)

def remove_duplicate(nums)
  current_index = 0
  right_pointer = nums.length - 1

  return 0 if nums.length < 2

  while current_index + 1 < right_pointer
    if nums[current_index] == nums[current_index+1]
      nums.delete_at(current_index+1)
    else
      current_index += 1
    end
  end

  return nums.length
end

p remove_duplicate([1,1,1,2])

# Anchor runner swap:
# Moves non-duplicates forward. Return anchor index. Also similar to move zeros

# Time: O(N)
# Space: O(1)

def remove_duplicate(nums)
  return 0 unless nums

  new_tail = 0
  nums.each_with_index do |_, index|
    puts "New tail: #{new_tail} Index: #{index}, Nums: #{nums}"
    if nums[new_tail] != nums[index]
      new_tail += 1 # Increment new_tail here so you don't cause nums to get out of order
      nums[new_tail], nums[index] = nums[index], nums[new_tail]
      # new_tail += 1
    end
  end
  p nums
  return new_tail + 1 # this is the number of unique elements in nums
end

p remove_duplicate([0,1,1,2,5,6])

# It's important to new_tail increment before the switch. Otherwsie the array nums to get out of order

# increment new_tail after switch
# New tail: 0 Index: 0, Nums: [0, 1, 1, 2, 5, 6]
# New tail: 0 Index: 1, Nums: [0, 1, 1, 2, 5, 6]
# New tail: 1 Index: 2, Nums: [1, 0, 1, 2, 5, 6]

# It's not intuitive, but the trick is to realize that we do an elements switch at 0,1, but we don't really want to do a switch then.
# Therefore we increment the tail so we "switch" 1 and 1 (it does nothing). See below

# increment new_tail before switch
# New tail: 0 Index: 0, Nums: [0, 1, 1, 2, 5, 6]
# New tail: 0 Index: 1, Nums: [0, 1, 1, 2, 5, 6]
# New tail: 1 Index: 2, Nums: [0, 1, 1, 2, 5, 6]

# However, once we have duplicates, then want to make sure that insert the next new value before the first duplicate (after the unique value). In other words, if we have [1,1,2], then we want to switch the 1 in the second position with the two to get [1,2,1]. If we had [1,1,1,2] then a the same process would get us [1,2,1,1] since our new tail would have stayed at the first position once because new_tail doesn't increment as we continue through a series of duplicates.

# increment new_tail before switch
# New tail: 1 Index: 3, Nums: [0, 1, 1, 2, 5, 6]
# New tail: 2 Index: 4, Nums: [0, 1, 2, 1, 5, 6]
# New tail: 3 Index: 5, Nums: [0, 1, 2, 5, 1, 6]
# [0, 1, 2, 5, 6, 1] / 5

# If we had incremented after the switch, it carries the non-duplicate integer forward which isn't what we want.

# increment new_tail after switch
# New tail: 2 Index: 3, Nums: [1, 1, 0, 2, 5, 6]
# New tail: 3 Index: 4, Nums: [1, 1, 2, 0, 5, 6]
# New tail: 4 Index: 5, Nums: [1, 1, 2, 5, 0, 6]
# [1, 1, 2, 5, 6, 0] / 6
