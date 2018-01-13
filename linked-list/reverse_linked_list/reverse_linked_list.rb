
class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

# Manual setup

# head = Node.new(1)
# head.next = Node.new(3)
#
# node = head.next
# node.next = Node.new(4)
#
# other_node = node.next
# other_node.next = Node.new(5)

# Manual setup two

# node = Node.new(1)
# node.next = Node.new(2)
# head = node

# Iteration setup

values = [3, 4, 5]
node = Node.new(1)
head = node

values.each do |value|
  new_node = Node.new(value)
  node.next = new_node
  node = new_node
end

def reverse_linked_list(head)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  nexxt = head.next.next

  current.next = previous # Ensures lists of length two are also reversed
  previous.remove_instance_variable(:@next) # Prevents us from creating a circular linked list

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

test = reverse_linked_list(head)
p test.data

# p head.data
# p head.next.data == 3
# p head.next.next.data == 3
