class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

def created_linked_list(values)
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

values = [1, 2, 3, 4, 5, 6, 7]
head = created_linked_list(values)

def reverse_list_until(head, stop)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next
  nexxt = head.next.next
  nodes_traversed = 0
  require 'pry'; binding.pry
  current.next = previous # Ensures lists of length two are also reversed
  previous.remove_instance_variable(:@next) # Prevents us from creating a circular linked list

  while !nexxt.nil? && nodes_traversed != stop
    nodes_traversed += 1
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

def reverse_list_between(head, new_head_position, new_tail_position)
  dummy = Node.new(nil)
  # Node prior to the next tail position (beginning of the section to reverse)
  before_new_tail = nil
  # Node prior to the next head position (end of the section to reverse)
  before_new_head = nil
  current = head
  dummy.next = current
  nodes_traversed = 0

  # require 'pry'; binding.pry
  # Find and set next tail variable
  while nodes_traversed != new_tail_position - 1
    return head if current.nil?
    # Leave previous one node before list to reverse section
    before_new_tail = current
    current = current.next
    nodes_traversed += 1
  end
  new_tail = current
  # require 'pry'; binding.pry

  # Find and set new head variable
  while nodes_traversed != new_head_position - 1
    return head if current.nil?

    before_new_head = current
    current = current.next
    nodes_traversed += 1
  end
  new_head = current

  tests = reverse_list_until(new_tail, new_head_position - new_tail_position)
  require 'pry'; binding.pry
  # Link new head to the node
  # new_head.next = before_new_head

  head.next
end

reverse_list_between(head, 5, 3)
