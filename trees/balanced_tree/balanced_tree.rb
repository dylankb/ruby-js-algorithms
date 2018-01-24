class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def is_balanced(node)
  is_balanced_helper(node, 0, 0)
end

def is_balanced_helper(node, left_depth, right_depth)
  return true if node.nil?
  left, right = node.left, node.right

  left_depth += depth_helper(left, left_depth)
  right_depth += depth_helper(right, right_depth)
  depth_delta = (left_depth - right_depth).abs

  left_result = is_balanced_helper(left, left_depth, right_depth)
  right_result = is_balanced_helper(right, left_depth, right_depth)

  return false unless left_result && right_result && (depth_delta <= 1)
  true
end

def depth_helper(node, depth)
  return 0 if node.nil?

  depth += 1
end

root = Node.new("1")
root.left = Node.new("2")
root.left.left = Node.new("3")


root2 = Node.new("I")

# first level
root2.left = Node.new("O")
root2.right = Node.new("H")

# second level
root2.left.left = Node.new("L")
root2.left.right = Node.new("R")
root2.right.left = Node.new("T")
root2.right.right = Node.new("M")

# third level
root2.left.left.left = Node.new("A")
root2.left.left.right = Node.new("G")

p is_balanced(root)
p is_balanced(root2)
