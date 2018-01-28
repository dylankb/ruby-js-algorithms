# Quickselect: Similar to quick sort, except that you are able to choose the left
# and right halves

# Creating the `length` variable was important since `right` is `array.length-1`
# in the the first `quick_select` call, but we need it to be `array.size` in the
# comparisons. You could avoid creating `length` by using `right+1` in the comparisons.

def quick_select(array, kth_largest, left = 0, right = array.length - 1)
  return nil if array.empty?
  pivot_index = rand(left..right)
  array, pivot_index = partition(array, left, right, pivot_index)

  length = array.size
  if (length - kth_largest) == pivot_index
    return array[pivot_index]
  elsif (length - kth_largest) > pivot_index
    left = pivot_index + 1
    quick_select(array, kth_largest, left, right)
  elsif (length - kth_largest) < pivot_index
    length = pivot_index - 1
    quick_select(array, kth_largest, left, right)
  end
end

def partition(array, first_index, last_index, pivot_index)
  pivot_value = array[pivot_index]
  wall_index = first_index # all items left of wall should be less than pivot
  array[last_index], array[pivot_index] = array[pivot_index], array[last_index]
  # Move pivot to end

  # Partition array, moving all lesser items to left of wall which marks pivot index
  (first_index..last_index).step(1) do |index|
    if array[index] < pivot_value
      array[wall_index], array[index] = array[index], array[wall_index]
      wall_index += 1
    end
  end

  # Move pivot value back to c
  array[wall_index], array[last_index] = array[last_index], array[wall_index]

  [array, wall_index]
end


result = quick_select([4,7,9,5,8,3,1,1,2], 4)
p result == 5
