class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def max_depth(node)
  return 0 if node.nil?

  left, right = node.left, node.right
  left_result = max_depth(left)
  right_result = max_depth(right)

  [left_result, right_result].max + 1
end

root = Node.new("1")
root.left = Node.new("2")
root.left.left = Node.new("3")

p max_depth(root)
