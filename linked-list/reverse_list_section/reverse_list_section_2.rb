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

values2 = [1, 2]
head2 = created_linked_list(values2)

values3 = values2.dup
head3 = created_linked_list(values2)

def reverse_list_between(head, section_start_position, section_end_position)
  return nil unless head
  return head unless head.next

  dummy = Node.new(nil)
  # Node prior to the beginning of the section to reverse (before the new tail)
  before_section = nil
  # Node following the section to be reversed (after the new head)
  after_section = nil

  previous = head
  current = head.next
  dummy.next = previous

  # If list is only length two, reverse and early return
  if current.next.nil?
    return reverse_list_until(previous, section_end_position - section_start_position)
  end

  # Else, reverse a section of the list and reattach it to the main one.

  # Problem space uses 1 as the initial index and `current` points to the second
  # list node
  nodes_traversed = 2

  # Find before section and section head (new tail) nodes
  while nodes_traversed != section_start_position
    return head if current.nil?
    # Leave previous one node before list to reverse section
    previous = current
    current = current.next
    nodes_traversed += 1
  end
  pre_section_node = previous
  section_start = current # new section head

  section_end, post_section_node = reverse_list_until(section_start,
                                                      section_end_position - section_start_position)
  # Link reversed section back into the main list
  pre_section_node.next = section_end
  section_start.next = post_section_node

  dummy.next
end

def reverse_list_until(head, links_to_reverse)
  return nil if head.nil?
  return head if head.next.nil?

  previous = head
  current = head.next

  nodes_reversed = 0

  while !current.nil? && nodes_reversed != links_to_reverse
    nexxt = current.next # 3 => 4
    current.next = previous # Do linking work
    previous.next = nil if nodes_reversed.zero? # Prevents circular linked list

    previous = current   # 1 => 2 - Also save linking work
    current = nexxt      # 2 => 3

    nodes_reversed += 1
  end
  # Two length lists reversed current is nil, but two length lists that skip
  # the while loop still have a value for `current`
  nexxt.nil? ? previous : [previous, current]
end

list = reverse_list_between(head, 3, 5)

p list.data == 1
p list.next.next.data == 5

list2 = reverse_list_between(head2, 1, 2)

p list2.data == 2
p list2.next.data == 1

list3 = reverse_list_between(head3, 1, 1)
# require 'pry'; binding.pry
p list3.data == 1
p list3.next.data == 2
