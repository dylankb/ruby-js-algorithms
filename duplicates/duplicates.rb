# https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/

def remove_duplicates(numbers)
  return 0 if numbers.length.zero

  index = 0
  numbers.times do |_|
    window_left = numbers[index]
    window_right = numbers[index + 1]

    if window_left == window_right
      numbers.delete_at(index + 1)
    else
      index += 1
    end
  end

  numbers
end

sorted_nums_array = [1, 2, 2, 2, 4, 4, 5, 6, 7, 7]
result = remove_duplicates(sorted_nums_array)

p result
