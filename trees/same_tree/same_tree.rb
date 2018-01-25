

# Approach 1 - Works, but inconsistent recursive return values

# def same_tree(root1, root2)
#   result_1 = same_tree_helper(root1)
#   result_2 = same_tree_helper(root2)
#
#   result_1 === result_2
# end
#
# def same_tree_helper(node)
#   return nil if node.nil?
#
#   result = []
#   right, left = node.right, node.left
#   left_result = same_tree_helper(left)
#   right_result = same_tree_helper(right)
#
#   result << node.val
#   result << left_result
#   result << right_result
#
#   result
# end
# p same_tree_helper(root) == ["1", ["2", nil, nil], nil]

# Approach 2: Check for node, node.left, and node.right equality between two nodes.
#             Overly complicated

# def same_tree(node1, node2)
#   return true if !node1 && !node2
#
#   return false if (!node1.left && node2.right) || (node1.left && !node2.right)
#
#   if node1.left && node2.left
#     return false if node1.left.val != node2.left.val
#   end
#
#   if node1.right && node2.right
#     return false if node1.right.val != node2.right.val
#   end
#
#   same_tree(node1.left, node1.right)
#   same_tree(node2.right, node2.right)
#
#   return false if node1.val != node2.val
#   return true if node1.val == node2.val
# end

def is_same_tree(node1, node2)
  return true if !node1 && !node2
  # return false if only one of the nodes is false
  return false if node1.nil? || node2.nil? # (!node1 && node2) || (node1 && !node2)
  return false if node1.val != node2.val

  left_result = is_same_tree(node1.left, node2.left)
  right_result = is_same_tree(node1.right, node2.right)

  # compare equality in each subtree
  left_result && right_result
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

root2 = Node.new("1")
root2.left = Node.new("2")

root3 = Node.new("1")
root3.left = Node.new("2")

root4 = Node.new("1")
root4.right = Node.new("2")

p is_same_tree(root, root2) == true
p is_same_tree(root3, root4) == false
