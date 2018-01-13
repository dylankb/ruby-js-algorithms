def merge_sorted_lists(list_1_node, list_2_node)
  dummy_head = Node.new(nil)
  previous = dummy_head

  while list_1_node && list_2_node
    # set `previous` to the smaller list node value
    if list_1_node.data <= list_2_node.data
      previous.next = list_1_node
      list_1_node = list_1_node.next
    else
      previous.next = list_2_node
      list_2_node = list_2_node.next
    end
    # Reassigns previous - otherwise we just reassign previous.next
    previous = previous.next
  end
  # If loop has ended, then either list_1_node or list_2_node are nil values
  # - i.e one of them has reached the end of the list and has been set to nil
  previous.next = list_1_node ? list_2_node : list_1_node
  # `previous` will be attached to the last element in list node that is set to
  # nil - this step changes the `next` value to an element instead of a nil

  require 'pry'; binding.pry
  dummy_head.next
end


class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

def created_linked_list(values)
  node = Node.new(1)
  head = node

  values.each do |value|
    new_node = Node.new(value)
    node.next = new_node
    node = new_node
  end

  head
end

values = [4, 5]
list_1_head = created_linked_list(values)

other_values = [2, 3, 6]
list_2_head = created_linked_list(other_values)

merge_sorted_lists(list_1_head, list_2_head)
