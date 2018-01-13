# Runtime: 0(N) / Space: O(N)

# Create hash of array 1
# Iterate through array 2

# If array 2 contains value in hash of array 1
# Then check if this intersection it is unique result

  # If hash contains key of given array 2's index value
  # - If results hash contains the value
  #  - Skip
  # - Else create a hash entry

def unique_array_intersections(nums1, nums2)
  results = []
  # create hash of first array for efficient comparisons
  nums1_hash = {}
  nums1.each do |value|
    nums1_hash[value] = false
  end

  nums2.each do |value|
    # Skip unless insertion value was already found
    next unless nums1_hash[value] == false
    # mark insertion as found
    nums1_hash[value] = true
    results.push(value)
  end

  results
end

nums1 = [1, 2, 2, 1]
nums2 = [2, 2]
p unique_array_intersections(nums1, nums2) == [2]

p unique_array_intersections([], [1,2,3]) == []
p unique_array_intersections([1], [1]) == [1]
p unique_array_intersections([], []) == []
p unique_array_intersections(['a', 'b'], ['a']) == ['a']
