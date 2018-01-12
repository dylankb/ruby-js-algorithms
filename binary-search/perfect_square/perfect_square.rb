# def is_perfect_square(num)
#   nums = (1..num).to_a
#
#   binary_search(nums, num)
#
# end

# def binary_search(array, val)
#   min = 0
#   max = array.length - 1
#   square = false
#
#   while min <= max do
#     midpoint = (min + max) / 2
#
#     require 'pry'; binding.pry
#     if array[midpoint] * array[midpoint] == val
#       square = true
#       break
#     elsif array[midpoint] * array[midpoint] > val
#       # midpoint = (min + max) / 2
#       max = midpoint - 1
#     elsif array[midpoint] * array[midpoint] < val
#       min = midpoint + 1
#     end
#   end
#   square
# end
#
# p is_perfect_square(100)


def is_perfect_square(num)
  binary_search(num)
end

def binary_search(val)
  min = 0
  max = val
  square = false

  while min <= max do
    midpoint = (min + max) / 2

    if midpoint * midpoint == val
      return true
      break
    elsif midpoint * midpoint > val
      max = midpoint - 1
    elsif midpoint * midpoint < val
      min = midpoint + 1
    end
  end
  square
end

p is_perfect_square()
p is_perfect_square(99)
