require_relative '../stack'
require_relative '../node'

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
    move_to_out
    out_stack.pop
  end

  def peek
    move_to_out
    out_stack.peek
  end

  private

  def move_to_out
    if out_stack.peek.nil?

      while !in_stack.peek.nil?
        popped_node = in_stack.pop
        out_stack.push(popped_node.data)
      end
    end
  end

end

queue = Queue.new

queue.enqueue(5)
queue.enqueue(6)

p queue.peek.data == 5
queue.dequeue
p queue.peek.data == 6

queue.enqueue(7)
p queue.peek.data == 6
