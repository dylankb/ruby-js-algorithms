# https://leetcode.com/problems/maximum-product-subarray/description/

# Question: Find the maximum product for a given index at that arrays index vs. array value at last_index..array.size-1

# Solution
# Keeps tracker of local minimum and maximum, accounting for negatives.

def max_product(nums)
  max_product = nums[0]
  min_product = nums[0]
  global_max = nums[0]

  for i in 1 ... nums.length
    max_copy, min_copy = max_product, min_product
    max_product = [ max_copy * nums[i], min_copy * nums[i], nums[i] ].max
    min_product = [ max_copy * nums[i], min_copy * nums[i], nums[i] ].min

    global_max = max_product if max_product > global_max
  end

  global_max
end

#
# max_product(last_index) = Max{ last_index * 1 vs. last_index * last_index + 1}
#                              OR Max{last_greatest_product vs. last_index * last_index + 2}
#                              ..... { ... +                                 array.size - 1}
#
# last_index = 0
#
# [2,3,-2,4]
#
# [2] = 2             current_index = 0
# [2,3] = 6           current_index = 1
# [2,3,-2] = -12      current_index = 2
# [2,3,-2,6] = -72    current_index = 3
#
# last_index = 1
#
# [3,-2,4]
#
# [3] = 3              current_index = 1
# [3,-2] = -6          current_index = 2
# [3,-2, 4] = -24      current_index = 3
#
# ...
#
# last_index = 3
# current_index = 3 (array.size -1)


#           max_product(0)
#           /
#         max_product(1)
#         /
#        max_product(2)
#       /
#     max_product(3)
#     /  => ?  r1 = 8; r2 = 8 * -1
#   max_product(4)
#       => -1

# First attempt - does not handle zeros or negative number

def max_product(numbers)
  return 0 if numbers.size == 0
  return numbers[0] if numbers.size == 1

  max_product_helper(numbers, 0)
end

def max_product_helper(numbers, last_index) # returns a number
  # base condition - return final value in array
  return numbers[last_index] if last_index == numbers.size - 1

  # product = numbers[last_index] * numbers[last_index + 1]

  result1 = numbers[last_index]
  result2 = max_product_helper(numbers, last_index + 1)

  return [result1, result1 * result2].max
end

p max_product([2,3,8,-1]) == 0
p max_product([0,2,3,8,-1]) == 0
