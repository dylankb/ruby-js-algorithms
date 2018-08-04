# Solution 4) Pre-nil tail pointer before while loop

# Very similar to the previous solution, except we don't have to involve a counter

def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  dummy = Node.new(nil)
  previous, current, nexxt = dummy, head, head.next
  current.next = nil # In 1 -> 2 -> 3, as the new tail we need to point the 1 to nil

  while !nexxt.nil?
    # Three window slide iteration
    previous = current   # D => 1
    current = nexxt      # 1 => 2
    nexxt = current.next # 2 => 3

    # Do linking work
    current.next = previous # 2 -> 1 / 3 -> 2
  end

  current
end


class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

# Iteration setup

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
