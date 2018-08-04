# Solution 3) While loop counter version

def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  dummy = Node.new(nil)
  previous, current, nexxt = dummy, head, head.next

  count = 0

  while !nexxt.nil?
    # Three window slide iteration
    previous = current   # D => 1
    current = nexxt      # 1 => 2
    nexxt = current.next # 2 => 3

    # Breaking condition prevents next iteration, but this code still executes
    previous.next = nil if count.zero? # In 1 -> 2 -> 3 we need to point the 1 -> nil
    current.next = previous # Do linking work

    count += 1
  end

  current
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
