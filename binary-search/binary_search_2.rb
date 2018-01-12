# More binary search attempts

# LS version

# def binary_search(array, target)
#   left = 0
#   right = array.size - 1
#   while left + 1 <  right
#     mid = left + (right - left) / 2   # instead of (left+right)/2 to minimize overflow
#     if array[mid] == target
#       # optional early return
#       return mid
#     elsif array[mid] > target
#       # always include mid in the next iteration
#       right = mid
#     else
#       left = mid
#     end
#   end
#
#   # If there is an array with a length of two left, then check both
#   if array[left] == target
#     return left
#   end
#   if array[right] == target
#     return right
#   end
# end
#
# p binary_search([1,2,3,4,5,6,7,8,9], 9)
# # puts binary_search([2,3,9,11,17,20,21], 10) # false
# puts binary_search([2,3,9,17,20,21], 9 # true


def binary_search(array, target)
  left = 0
  right = array.size - 1
  while left <= right
    mid = left + (right - left) / 2   # instead of (left+right)/2 to minimize overflow
    if array[mid] == target
      # optional early return
      return mid
    elsif array[mid] > target
      # always include mid in the next iteration
      right = mid - 1
    else
      left = mid + 1
    end
  end
end

puts binary_search([1,2,3,4,5,6,7,8,9], 9)
# puts binary_search([2,3,9,11,17,20,21], 10) # false
puts binary_search([2,3,9,17,20,21], 9) # true

# loop ends when left and right pointers are next to earch other; either could be the result

# Destructive - not as optimal

# def binary_search(numbers, target)
#   return false if numbers.empty?
#
#   result = nil
#   # create midpoint for even arrays
#   if numbers.length.even?
#     mid = numbers.length / 2
#     average = (numbers[mid] + numbers[mid - 1]) / 2
#     numbers.insert(mid, average)
#   end
#
#
#   while !result
#     result = numbers[0] if numbers.length == 1
#
#     midpoint = numbers.length / 2
#     midpoint_value = numbers[midpoint]
#
#     if target == midpoint_value
#       result = midpoint_value
#     elsif midpoint_value > target
#       numbers = numbers[0..(midpoint - 1)]
#     else
#       numbers = numbers[(midpoint + 1)..(numbers.length - 1)]
#     end
#   end
#
#   return result == target ? true : false
# end
#
# puts binary_search([2,3,9,11,17,20,21], 9) # true
# puts binary_search([2,3,9,11,17,20,21], 10) # false
# puts binary_search([2,3,9,17,20,21], 9 # true
