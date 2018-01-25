class Queue
  attr_reader :in_stack, :out_stack

  def initialize
    @in_stack = Stack.new
    @out_stack = Stack.new
  end

  def enqueue(data)
    in_stack.push(data)
  end

  def dequeue
    move_to_out()
    out_stack.pop()
  end

  def peak
    move_to_out()
    out_stack.peak()
  end

  private

  def move_to_out
    if out_stack.peak.nil?

      while !in_stack.peak.nil?
        popped_node = in_stack.pop()
        out_stack.push(popped_node.data)
      end
    end
  end

end

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

queue = Queue.new

queue.enqueue(5)
queue.enqueue(6)

p queue.peak().data == 5
queue.dequeue
p queue.peak().data == 6

queue.enqueue(7)
p queue.peak().data == 6
