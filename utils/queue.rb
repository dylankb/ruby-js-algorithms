require_relative 'node'

class Queue
  attr_accessor :last, :first
  private :last, :first

  def enqueue(data)
    node = Node.new(data)
    if last
      last.next = node
      self.last = node
    else
      self.last = node
      self.first = node
    end
  end

  def dequeue
    return nil unless first
    old_first = first

    if first.next
      self.first = old_first.next
      old_first.next = nil
    else
      self.first = nil
      self.last = nil
    end

    old_first
  end

  def peek
    first
  end

  def empty?
    peek.nil?
  end
end
