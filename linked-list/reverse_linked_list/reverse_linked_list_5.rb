class Node
  attr_accessor :val, :next

  def initialize(val = nil)
    @val = val
  end
end

def create_linked_list(number)
  node = Node.new
  head = node

  number.times do |index|
    node.next = Node.new
    node.val = index
    node = node.next
  end

  head
end

head = create_linked_list(2)

def reverse_list(head)
  current = head
  nexxt = current.next
  return current if nexxt.nil?

  dummy = Node.new
  dummy.next = current

  while !current.next.nil?
    head = dummy.next

    dummy.next = nexxt # move final to beginning
    current.next = nexxt.next # update tail
    nexxt.next = head # reconnect new head to previous head

    nexxt = current.next
  end

  head
end

reversed = reverse_list(head)

p reversed
