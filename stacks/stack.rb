class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

class Stack
  def initialize
  end

  def push(data)
    node = Node.new(data)
    if @head
      old_head = @head
      @head = node
      @head.next = old_head
    end
    @head = node
  end

  def peak
    @head
  end

  def pop
    if !@head.nil?
      old_head = @head
      @head = old_head.next
      old_head.next = nil

      old_head
    end
  end
end

stack = Stack.new
stack.push(3)
stack.push(4)
p stack.peak.data
stack.pop
p stack.peak.data
stack.pop
stack.pop()
