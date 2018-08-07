require_relative 'node'

class Stack
  attr_accessor :top
  private :top

  def push(data)
    require 'pry'; binding.pry
    node = Node.new(data)
    node.next = top if top
    self.top = node
  end

  def peek
    top
  end

  def pop
    return nil if top.nil?

    # set new top
    old_top = top
    self.top = top.next

    # remove old top from stack
    old_top.next = nil

    old_top
  end

  def empty?
    peek.nil?
  end
end

# stack = Stack.new
# stack.push(3)
# stack.push(4)
# p stack.peek.data == 4
# popped = stack.pop
# p popped.data == 4
# p popped.data.next.nil?
#
# p stack.peek.data == 3
# stack.pop
# stack.pop()
# p stack.peek.nil?
