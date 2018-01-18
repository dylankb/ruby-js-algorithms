def max_number(array)
  max = array[0]
  max_number_helper(array, 0, max)
end

def max_number_helper(array, index, max)
  return max if index == array.size
  # if index == array.size
  #   max = max
  # end

  if max < array[index]
    max = array[index]
  end

  max_number_helper(array, index + 1, max)
end

p max_number([1,2,3,4,3,8,1]) == 8
p max_number([2,1]) == 2
p max_number([2])== 2
