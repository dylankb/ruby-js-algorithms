# Three window slide where the first.next = third element to create even/odd groups

# Resulting test cases:
# Odd numbered linked lists need the last node set to nil

# 1 -> 2 - 3       | 1 -> 3  / 2 -> 3 - 2
# 1 -> 2 - 3 -> 4  | 1 -> 3  / 2 -> 4

# if c is even
#   then assign previous.next = evens_head
# else
#   set previous.next = nil
#   assign current.next = evens_head

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

def odds_evens_group(head)
  return nil if head.nil?
  return head if head.next.nil?

  counter = 0

  previous = head
  current = head.next
  nexxt = head.next.next

  # Creater a variable pointing to this node -
  # we will attach this to the end of odds later
  evens_head = current

  while !nexxt.nil?
    previous.next = nexxt # link each number to its next odd/even pair

    # iteration
    previous = current
    current = nexxt
    nexxt = current.next

    counter += 1
  end

  if counter.zero? || counter % 2 == 0
    previous.next = evens_head
  else
    previous.next = nil
    current.next = evens_head
  end

  head
end

head = created_linked_list([1,2,3])
head2 = created_linked_list([1,2])
head3 = created_linked_list([1,2,3,4,5])
head4 = created_linked_list([1,2,3,4,5,6,7,8])

# list = odds_evens_group(head)
# p list.data == 1
# p list.next.data == 3
# p list.next.next.data == 2
# p list.next.next.next.nil?
#
# list2 = odds_evens_group(head2)
# p list2.data == 1
# p list2.next.data == 2
# p list2.next.next.nil?
#
# list3 = odds_evens_group(head3)
# p list3.data == 1
# p list3.next.data == 3
# p list3.next.next.data == 5
# p list3.next.next.next.data == 2
# p list3.next.next.next.next.data == 4
# p list3.next.next.next.next.next.nil?

list4 = odds_evens_group(head4)
p list4.data == 1
p list4.next.data == 3
p list4.next.next.data == 5
p list4.next.next.next.data == 7
p list4.next.next.next.next.data == 2
