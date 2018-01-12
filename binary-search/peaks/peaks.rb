# Reference solution #1

# def find_peak_element(nums)
#   left = 0
#   right = nums.length - 1
#
#   while (left + 1) < right do
#     mid = left + ((right -left) / 2)
#
#     if (nums[mid] > nums[mid + 1] && nums[mid] > nums[mid - 1])
#       return mid
#     elsif nums[mid] < nums[mid + 1]
#       left = mid
#     else
#       right = mid
#     end
#   end
#
#   return nums[left] > nums[right] ? left : right
# end

# Reference solution #2

# def find_peak_element(nums)
#   left = 0
#   right = nums.length - 1
#
#   while left <= right do
#     midpoint = (left + right) / 2
#
#     if nums[midpoint+1] && nums[midpoint] < nums[midpoint + 1] #ascending sequence
#       left = midpoint + 1
#     elsif nums[midpoint-1] && nums[midpoint] < nums[midpoint - 1] #descending sequence
#       right = midpoint - 1
#     else # num at midpoint is > midpoint + 1 and > midpoint - 1
#       return midpoint
#     end
#   end
# end
