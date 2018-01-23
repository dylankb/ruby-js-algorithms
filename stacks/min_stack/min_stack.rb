class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
  end
end

class Stack
  def initialize
    @minimum_node = Node.new(Float::INFINITY)
  end

  def push(data)
    node = Node.new(data)
    if node.data < @minimum_node.data
      @minimum_node = node
    end

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

  def get_min
    @minimum_node
  end
end

stack = Stack.new
stack.push(3)
stack.push(4)
stack.push(5)
p stack.get_min()
