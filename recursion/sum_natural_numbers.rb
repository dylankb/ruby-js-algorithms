# What is a list?

# A list can be thought of as a the start of a list (head) plus the rest of the list.
# In the case of [1,2], 1 would be the head and 2 would be the rest of the list, or
# tail.

# What is the sum of a list?

# We can think of the sum of a list as the head plus the sum of the tail. If we have
# this as our mental model, the rest of the code is simpler to write.

def sum_naturals(nums)
  head = nums[0]
  tail = nums[1..-1]
  if tail == []
    head
  else
    head + sum_naturals(tail)
  end
end

p sum_naturals((1..5).to_a)
