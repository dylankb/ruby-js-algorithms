def is_valid?(string)
  stack = Stack.new
  paren_list = ['{','}','(',')','[',']']
  paren_dict = create_dictionary(paren_list)

  string.split('').each do |character|

    if paren_dict.has_key?(character)
      stack.push(character)
    elsif paren_dict.has_value?(character)
      return false unless remove_matched_closing_paren(character, stack, paren_dict)
    else
      next
    end
  end

  return true if is_empty?(stack)
  false
end

def remove_matched_closing_paren(character, stack, paren_dict)
  if !is_empty?(stack) && paren_dict[stack.peak.data] == character
    stack.pop()
    true
  end
end

def create_dictionary(list)
  dictionary = {}
  list.each_slice(2) do |opener, closer|
    dictionary[opener] = closer
  end

  dictionary
end

def is_empty?(stack)
  stack.peak.nil?
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
    old_head = @head
    @head = old_head.next

    old_head.next = nil
  end
end

p is_valid?('[') == false
p is_valid?('()') == true
p is_valid?('(){}') == true
p is_valid?('(()(){})') == true
p is_valid?('()(){})') == false
p is_valid?("( {}) ()") == true
p is_valid?("( {}) () )") == false
p is_valid?("( ({}) () )") == true
