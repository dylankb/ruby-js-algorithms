class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def invert_tree(node)
  # return a node or nil
  return nil if node.nil?

  left, right = node.left, node.right
  left_result = invert_tree(left)
  right_result = invert_tree(right)

  node.left = right_result
  node.right = left_result

  node
end

root = Node.new("1")
root.left = Node.new("2")

p invert_tree(root)
