# https://leetcode.com/problems/minimum-size-subarray-sum/description/

# Moving, growing window size

# [2, 3, 4, 5]
# [2] => [3] => [4] ..
# [2, 3] => [3, 4] ..
# [2, 3, 4] => ..

def minimum_array(numbers, target)
  iterations = numbers.length
  window_size = 1
  while iterations do

    iterations.times do |i|
      test_array = numbers[i..i + (window_size - 1)]
      test_sum = test_array.reduce(&:+)

      return test_array if test_sum == target
    end

    iterations -= 1
    window_size += 1
  end

  - 1
end


array = [2, 3, 1, 2, 4, 3]

p minimum_array(array, 6)
