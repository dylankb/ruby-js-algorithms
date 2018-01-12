# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/

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
result = two_sum(sorted_nums_array, 6) # [5, 7]
p result
