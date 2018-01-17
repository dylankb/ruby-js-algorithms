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
head3 = created_linked_list(values3)

values4 = [1, 2, 3]
head4 = created_linked_list(values4)

values5 = values4.dup
head5 = created_linked_list(values5)

def reverse_list_between(head, section_start_position, section_end_position)
  return nil unless head
  return head unless head.next
  return head if section_start_position == section_end_position

  dummy = Node.new(nil)

  previous = dummy
  current = head
  previous.next = current # Link the first two nodes together

  # Problem space uses 1 as the initial index
  nodes_traversed = 1

  # Find before section and section head (new section's tail) nodes
  while nodes_traversed != section_start_position
    return head if current.nil?
    # Leave previous one node before list to reverse section
    previous = current
    current = current.next
    nodes_traversed += 1
  end
  # Node prior to the beginning of the section to reverse (before the new tail)
  pre_section = previous
  section_start = current # new section's head

  # Node following the section to be reversed (after the new head) -
  # may remain nil if there are no nodes after reversed section
  section_end, post_section = reverse_list_until(section_start,
                                                      section_end_position - section_start_position)
  # Link reversed section back into the main list
  pre_section.next = section_end
  section_start.next = post_section if post_section

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

  # `current` is nil for length two lists
  [previous, current]
end

list = reverse_list_between(head, 3, 5)

p list.data == 1
p list.next.next.data == 5

list2 = reverse_list_between(head2, 1, 2)

p list2.data == 2
p list2.next.data == 1

list3 = reverse_list_between(head3, 1, 1)

p list3.data == 1
p list3.next.data == 2

list4 = reverse_list_between(head4, 2, 2)

p list4.data == 1
p list4.next.data == 2
p list4.next.next.data == 3

list5 = reverse_list_between(head5, 1, 2)

p list5.data == 2
p list5.next.data == 1
p list5.next.next.data == 3
