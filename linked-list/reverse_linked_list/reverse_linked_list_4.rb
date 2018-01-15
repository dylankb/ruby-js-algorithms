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

# Pre loop circular list prevention

# Like version 1, this version also does use a dummy and prevents the circular
# loop problem before hitting the while loop.
def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  # By default `previous` will have a `next` of `current` - setting current.next
  # is set to `previous` without the line below it creates a circular list.
  # `previous` must be head to include this line above the while loop
  previous.next = nil

  while !current.nil?
    nexxt = current.next # 3 => 4
    current.next = previous # Do linking work

    previous = current   # 1 => 2 - Also save linking work
    current = nexxt      # 2 => 3
  end

  previous
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
