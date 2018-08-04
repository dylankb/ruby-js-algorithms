# Solution 6) Pre loop circular list prevention with clearer three window slide

# Similar to version 4, except that we've changed the logic for iteration and linking
# work.
def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  nexxt = current.next

  previous.next = nil

  while !current.nil?
    # Do linking work
    current.next = previous # 2 -> 1

    # Three window slide
    previous = current    # 1 => 2
    current = nexxt       # 2 => 3
    nexxt = current.next if current # 3 => 4
  end

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
