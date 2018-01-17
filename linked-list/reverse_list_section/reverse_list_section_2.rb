# https://leetcode.com/problems/reverse-linked-list-ii/description/

def reverse_between(head, reverse_start_position, reverse_end_position)
  counter = 1
  runner = head

  # node that comes just before the reversed section
  reverse_prefix = nil

  # node that comes just after the reversed section
  reverse_after = nil

  # node that is last (then first) of the reversed section
  reverse_new_head = nil

  # node that is first (then last) of the reversed section
  reverse_new_tail = nil

  while runner
    # require 'pry'; binding.pry
    next_node = runner.next
    if counter >= reverse_start_position && counter <= reverse_end_position
      # reversal section
      previous = reverse_new_head
      reverse_new_head = runner
      runner.next = previous # first pass is nil - prevents circular linked list
      # reverse_new_head, reverse_new_head.next = runner, reverse_new_head
    end

    reverse_new_tail = runner if counter == reverse_start_position
    reverse_prefix = runner if counter == reverse_start_position - 1
    reverse_after = runner if counter == reverse_end_position + 1

    counter += 1
    runner = next_node
  end

  # Connect reversed section head back to main list if needed
  reverse_prefix ? reverse_prefix.next = reverse_new_head : head = reverse_new_head

  # Connect reversed section tail back to main list if needed
  # If there's no nodes after reversal, assigning `.next` to nil is safe.
  reverse_new_tail.next = reverse_after
  # reverse_new_tail = runner if runner # Possible alternative

  head
end

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

# values = [1, 2, 3, 4, 5, 6, 7]
# head = created_linked_list(values)
#
# list = reverse_between(head, 2, 4)
#
# p list.data == 1
# p list.next.data == 4
# p list.next.next.data == 3
# p list.next.next.next.data == 2
# p list.next.next.next.next.data == 5

values2 = [1, 2]
head2 = created_linked_list(values2)

list2 = reverse_between(head2, 1, 2)
p list2.data == 2
p list2.next.data == 1
p list2.next.next.nil?
