# https://leetcode.com/problems/house-robber/

# Given a list of non-negative integers representing the amount of money of each
# house, determine the maximum amount of money you can retrieve from non-adjacent
# houses

def rob(nums)
  if nums.length == 0
    return 0
  end

  if nums.length == 1
    return nums[0]
  end

  rob_helper(nums, nums.length - 1)
end

def rob_helper(nums, current)
  if current <= 0
    return nums[0]
  end

  if current <= 1
    return nums[0..current].max
  end

  result1 = rob_helper(nums, current - 1)
  result2 = rob_helper(nums, current - 2) + nums[current]

  [result1, result2].max
end

p rob([1,2,3,4,5])
