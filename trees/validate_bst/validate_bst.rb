class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def is_valid_bst(node)
  return true if node.nil?

  left, right = node.left, node.right

  if left
    return false if left.val >= node.val
  end
  if right
    return false if right.val <= node.val
  end

  left_result = is_valid_bst(left)
  right_result = is_valid_bst(right)

  true
end

root = Node.new("2")
root.left = Node.new("1")
root.right = Node.new("3")

root2 = Node.new("1")
root2.left = Node.new("2")
root2.right = Node.new("3")

root3 = Node.new("2")
root3.right = Node.new("3")
root3.right.left = Node.new("1")

p is_valid_bst(root) == true
p is_valid_bst(root2) == false
p is_valid_bst(root3) == false # true. should use higher up nodes to confirm validity
