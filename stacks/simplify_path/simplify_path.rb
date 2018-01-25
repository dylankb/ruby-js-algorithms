def simplify_path(path)
  return '/' if path =~ /\//

  stack = Stack.new
  path_segments = path.split('/')

  path_segments.each do |path|
    if path =~ /\w/
      stack.push('/' + path)
    elsif path == '..'
      stack.pop()
    else
      next
    end
  end

  simplified_path = ''
  while !stack.peak.nil?
    simplified_path += stack.pop().data
  end

  simplified_path
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

p simplify_path("/") == "/"
p simplify_path("/home/") == "/home"
p simplify_path("/a/./b/../../c/") == "/c"
