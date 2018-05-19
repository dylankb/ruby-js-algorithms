# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/

# Pointers solution

# Time: O(N)
# Space: O(1)

def two_sum(numbers, target)
  left_pointer = 0
  right_pointer = numbers.length - 1
  searched_all_elements = false

  while !searched_all_elements
    if numbers[left_pointer] + numbers[right_pointer] > target
      right_pointer -= 1
    elsif numbers[left_pointer] + numbers[right_pointer] < target
      left_pointer += 1
    elsif numbers[left_pointer] == numbers[right_pointer]
      searched_all_elements = true
    else
      return [left_pointer, right_pointer]
    end
  end
end

sorted_nums_array = [1, 2, 2, 2, 4, 4, 5, 6, 7, 7]
result = two_sum(sorted_nums_array, 6)
p result # [0, 6]

def two_sum(numbers, target)
  current_index = 0
  high_index = numbers.length - 1

  while current_index < high_index
    result = binary_search(numbers, target - numbers[current_index])
    if !result
      current_index +=1
    else
      return [numbers[current_index], numbers[result]]
    end
  end
end

def binary_search(numbers, target)
  low_index = 0
  high_index = numbers.count - 1

  while low_index <= high_index
    midpoint_index = (high_index + low_index) / 2
    guess = numbers[midpoint_index]

    if guess == target
      return midpoint_index
    elsif guess > target
      high_index = midpoint_index - 1
    else
      low_index = midpoint_index + 1
    end
  end

  return nil
end

p two_sum([3,4,6,8,9,19,21,22], 25) # [3, 22]
