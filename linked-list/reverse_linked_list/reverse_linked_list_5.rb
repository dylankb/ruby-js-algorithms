# Solution 5) Pre loop circular list prevention

# Similar to version 4, except in this case we aren't using a dummy node. Right off
# the bat we just point the first element of the list, say `1`, in 1 -> 2 -> 3 to
# `nil`. Again, why do we do that? By default `previous` will have a `next` pointed to
# `current` - so setting `current.next` to `previous` without setting
# `previous.next = nil` would create a  `previous` must be head to include this line
# above the while loop.

# Additionally, in this version we don't create a dummy node, and the simplest reason
# why is I suppose we don't strictly need it. The first clue that we didn't need a dummy
# node was that we didn't use it in anywhere except to make a slightly safer start to a
# three window slide when there are only two
def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  nexxt = current.next

  previous.next = nil

  while !current.nil?
    # Start three window slide by caching reference to nexxt
    nexxt = current.next    # 3

    # Do linking work
    current.next = previous # 2 -> 1

    # Finish three window slide
    previous = current   # 1 => 2 - Save linking work
    current = nexxt      # 2 => 3
  end
  # while !current.nil?
  #
  #   # Do linking work
  #   current.next = previous # 2 -> 1
  #
  #   # Finish three window slide
  #   previous = current    # 1 => 2
  #   current = nexxt       # 2 => 3
  #   nexxt = current.next if current # 3 => 4
  # end

  previous
end

class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

# Setup

def create_linked_list(values)
  node = Node.new(values[0])
  head = node

  values.each_with_index do |value, index|
    next unless index > 0
    new_node = Node.new(value)
    node.next = new_node
    node = new_node
  end

  head
end

values = [1, 2]
head = create_linked_list(values)

values2 = [1, 2, 3, 4, 5]
head2 = create_linked_list(values2)


# Test cases

values = [1, 2]
head = create_linked_list(values)

values2 = [1, 2, 3]
head2 = create_linked_list(values2)

values3 = [1, 2, 3, 4]
head3 = create_linked_list(values3)

values4 = [1, 2, 3, 4, 5]
head4 = create_linked_list(values4)

list = reverse_linked_list(head)
p list.data == 2
p list.next.data == 1
p list.next.next.nil?

list2 = reverse_linked_list(head2)
p list2.data == 3
p list2.next.data == 2
p list2.next.next.data == 1
p list2.next.next.next.nil?

list3 = reverse_linked_list(head3)
p list3.data == 4
p list3.next.data == 3
p list3.next.next.data == 2
p list3.next.next.next.data == 1
p list3.next.next.next.next.nil?

list4 = reverse_linked_list(head4)
p list4.data == 5
p list4.next.data == 4
p list4.next.next.data == 3
p list4.next.next.next.data == 2
p list4.next.next.next.next.data == 1
p list4.next.next.next.next.next.nil?
