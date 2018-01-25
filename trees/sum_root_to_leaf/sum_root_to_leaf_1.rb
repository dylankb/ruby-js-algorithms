# Variant of https://leetcode.com/problems/sum-root-to-leaf-numbers/description/:
# Sums all root + leaf numbers. Does not include intermediary branch node numbers

def sum_root_to_leaf(root)
  root_value = root ? root.val : 0
  sum_root_to_leaf_helper(root, root_value, { sum: 0 })
end

def sum_root_to_leaf_helper(node, root_value, total)
  return 0 if node.nil?

  if is_leaf?(node.left, node.right)
    root_to_leaf = (root_value.to_s + node.val.to_s).to_i
    total[:sum] += root_to_leaf

    return node.val
  end

  sum_root_to_leaf_helper(node.left, root_value, total)
  sum_root_to_leaf_helper(node.right, root_value, total)

  total[:sum]
end

def is_leaf?(left_node, right_node)
  left_node.nil? && right_node.nil?
end

class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

root = Node.new("1")
root.left = Node.new("2")
root.left.left = Node.new("3")

root.right = Node.new("4")

root2 = Node.new("9")

p sum_root_to_leaf(root) == 27
p sum_root_to_leaf(root2) == 9
