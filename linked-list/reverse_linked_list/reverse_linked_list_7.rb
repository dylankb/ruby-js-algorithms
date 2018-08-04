# Solution 7) This solution is a bit harder for me to wrap my head around because there
# is so 3 list updates per step. However, one thing I like about this approach is that
# in the final step the tail is always set to nil.

def reverse_list(head)
  current = head
  nexxt = current.next
  return current if nexxt.nil?

  dummy = Node.new
  dummy.next = current

  while !nexxt.nil?
    # Save previous head
    head = dummy.next

    # List updates
    dummy.next = nexxt        # D -> 2 - move final to beginning
    current.next = nexxt.next # 1 -> nil - update tail
    nexxt.next = head         # 2 -> 1 - reconnect new head to previous head

    nexxt = current.next      # 3
  end

  dummy.next
end

class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
  end
end

def create_linked_list(values)
  dummy = Node.new(nil)
  current = dummy

  values.each do |value|
    new_node = Node.new(value)
    current.next = new_node
    current = new_node
  end

  dummy.next
end

# Example walkthrough - why use a separate `head` variable

# Given a list of 1 -> 2 -> 3, here's what would happen without the separate head variable

# Iteration 1

#   while !nexxt.nil?
#     head = dummy.next         # 1 -> 2 -> 3
#     dummy.next = nexxt        # D -> 2 - move final to beginning
#     current.next = nexxt.next # 1 -> 3 - update tail
#     nexxt.next = current      # 2 -> 1 - reconnect new head to previous head
#
#     nexxt = current.next      # 3
#   end
#
#   dummy.next # => 2 -> 1 -> 3
# end

# Iteration 2

#   while !nexxt.nil?
#     head = dummy.next         # 2 -> 1 -> 3
#     dummy.next = nexxt        # D -> 3 - move final to beginning, but we lose reference to 2
#     current.next = nexxt.next # 1 -> nil - update tail
#     nexxt.next = current      # nil => 1 - reconnect new head to previous head
#
#     nexxt = current.next      # nil
#   end
#
#   dummy.next # => 3
# end

# But if we use a head variable...

# Iteration 1

#   while !nexxt.nil?
#     head = dummy.next         # 1 -> 2 -> 3
#
#     dummy.next = nexxt        # D -> (2 -> 3) - move final to beginning
#     current.next = nexxt.next # 1 -> 3 - update tail
#     nexxt.next = head         # 2 -> 1 - reconnect new head to previous head
#
#     nexxt = current.next      # 3
#   end
#
#   dummy.next # => 2
# end

# Iteration 2

#   while !nexxt.nil?
#     head = dummy.next         # 2 -> 1 -> 3

#     dummy.next = nexxt        # D -> 3 - move final to beginning
#     current.next = nexxt.next # 1 -> nil - update tail, which changes head => 2 -> 1
#     nexxt.next = head         # 3 -> 2 (-> 1) - reconnect new head to previous head
#
#     nexxt = current.next      # nil
#   end
#
#   dummy.next # => 3
# end

# Test cases

# length = [1, 2]
# head = create_linked_list(length)
#
# list = reverse_list(head)
# p list.data == 2
# p list.next.data == 1
# p list.next.next.nil?

length2 = [1, 2, 3]
head2 = create_linked_list(length2)

list2 = reverse_list(head2)
p list2.data == 3
p list2.next.data == 2
p list2.next.next.data == 1
p list2.next.next.next.nil?

length3 = [1, 2, 3, 4]
head3 = create_linked_list(length3)

list3 = reverse_list(head3)
p list3.data == 4
p list3.next.data == 3
p list3.next.next.data == 2
p list3.next.next.next.data == 1
p list3.next.next.next.next.nil?

length4 = [1, 2, 3, 4, 5]
head4 = create_linked_list(length4)

list4 = reverse_list(head4)
p list4.data == 5
p list4.next.data == 4
p list4.next.next.data == 3
p list4.next.next.next.data == 2
p list4.next.next.next.next.data == 1
p list4.next.next.next.next.next.nil?
