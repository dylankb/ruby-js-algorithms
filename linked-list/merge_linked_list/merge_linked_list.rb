# https://leetcode.com/problems/merge-two-sorted-lists/

def merge_sorted_lists(list1_node, list2_node)
  dummy_head = Node.new(nil)
  list_tail = dummy_head

  while list1_node && list2_node
    # set `list_tail` to the smaller list node value
    if list1_node.data <= list2_node.data
      list_tail.next = list1_node
      list1_node = list1_node.next
    else
      list_tail.next = list2_node
      list2_node = list2_node.next
    end
    # Move list_tail up to current list tail - otherwise we would just be continually reassigning list_tail.next
    list_tail = list_tail.next
  end
  # If loop has ended, then either list1_node or list2_node are nil values
  # - i.e one of them has reached the end of the list and has been set to nil
  list_tail.next = list1_node ? list2_node : list1_node
  # If that's the case, then we can set the current point of the list with remainy nodes
  # to the end of `list_tail`

  dummy_head.next
end

class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

def created_linked_list(values)
  dummy = Node.new(nil)
  current = dummy

  values.each do |value|
    new_node = Node.new(value)
    current.next = new_node
    current = new_node
  end

  dummy.next
end

values = [4, 5]
list1_head = created_linked_list(values)
p list1_head

other_values = [2, 3, 6]
list2_head = created_linked_list(other_values)
p list2_head

# merge_sorted_lists(list_1_head, list_2_head)
