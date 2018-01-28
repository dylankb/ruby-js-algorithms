# Choose the number in the middle
# Check if it's correct
# If less than middle number,
#   go select middle number on left side
# Repeat until number is found
# Return nil if not found

# First attempt - missing an exit clause if number not found
# def binary_search(collection, number)
#   middle_index = collection.length / 2
#   result = collection[middle_index]
#   while result != number
#     if result > number
#       middle_index = (0..middle_index).to_a.length / 2
#       result = collection[middle_index]
#     elsif result < number
#       middle_index = (middle_index..(collection.length - 1)).to_a.length / 2
#       result = collection[middle_index]
#     end
#   end
#   result
# end

# collection = [1,2,3,4,5,6,7]
# puts binary_search(collection, 2)

def binary_search(collection, number)
  lower_bound = 0
  upper_bound = collection.length - 1

  while upper_bound >= lower_bound do
    midpoint = (upper_bound + lower_bound) / 2
    value_at_midpoint = collection[midpoint]

    if value_at_midpoint > number
      # Since the last number checked was too large, move midpoint to one below the index of the last checked number
      upper_bound = midpoint - 1
    elsif value_at_midpoint < number
      # Since the last checked number was too small, move lower search limit to one past the checked number
      lower_bound = midpoint + 1
    elsif value_at_midpoint === number
      return value_at_midpoint
    end
  end
  nil
end

collection = [1,2,3,4,5,6,7]

puts binary_search(collection, 2)
# puts binary_search(collection, 1)
# puts binary_search(collection, 5)
