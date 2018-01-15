class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

# Manual setup

# node = Node.new(1)
# node.next = Node.new(2)
# head = node

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

values = [1, 2]
head = create_linked_list(values)

values2 = [1, 2, 3, 4, 5]
head2 = create_linked_list(values2)

# Switch and nil out circular loop first version

# Need to set first `previous.next` in the first iteration to prevent creating
# a circular linked list. This version does so before entering the while loop.
def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  nexxt = head.next.next

  current.next = previous
  previous.remove_instance_variable(:@next) # Removes circular loop

  while !nexxt.nil?
    # Block of code that iterates our three-window solution:

    # `previous` is now the head or the closest node to the head, so we can leave it
    # behind as it's already being pointed to correctly.
    # I.e if the list is: 1 -> 2 -> 3 -> 4
    previous = current   # 1 => 2
    current = nexxt      # 2 => 3
    nexxt = current.next # 3 => 4

    current.next = previous
  end

  current
end

# Test cases

list = reverse_linked_list(head)
p list.data == 2
p list.next.data == 1
p list.next.next.nil?

list2 = reverse_linked_list(head2)
p list2.data == 5
p list2.next.data == 4
p list2.next.next.data == 3
p list2.next.next.next.data == 2
p list2.next.next.next.next.data == 1
p list2.next.next.next.next.next.nil?
