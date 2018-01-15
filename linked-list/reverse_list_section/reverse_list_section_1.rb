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

  # Problem space uses 1 as the initial index and `current` has reached the
  # second list node
  nodes_traversed = 2

  # Find before section and section head (new tail) nodes
  while nodes_traversed != section_start_position && section_start_position > 1
    return head if current.nil?
    # Leave previous one node before list to reverse section
    previous = current
    current = current.next
    nodes_traversed += 1
  end
  pre_section_node = previous
  section_start = current # new section head
  require 'pry'; binding.pry
  section_end, post_section_node = reverse_list_until(section_start,
                                                      section_end_position - section_start_position)
  # require 'pry'; binding.pry
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
  nexxt = head.next.next

  current.next = previous
  # Prevents us from creating a circular linked list
  previous.remove_instance_variable(:@next)
  nodes_reversed = 1 # Previous line reversed a node link

  # Skips block for two length lists
  while !nexxt.nil? && nodes_reversed != links_to_reverse
    nodes_reversed += 1

    previous = current   # 1 => 2
    current = nexxt      # 2 => 3
    nexxt = current.next # 3 => 4

    current.next = previous
  end

  [current, nexxt]
end

# list = reverse_list_between(head, 3, 5)
#
# p list.data == 1
# p list.next.next.data == 5

list2 = reverse_list_between(head2, 1, 2)

p list2.data == 2
p list2.next.data == 1
