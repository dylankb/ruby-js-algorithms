# https://leetcode.com/problems/sum-root-to-leaf-numbers/description/

def sum_root_to_leaf(root)
  sum_root_to_leaf_helper(root, 0)
end

def sum_root_to_leaf_helper(node, total)
  return 0 if node.nil?
  # 12 = '1' + '2' to integers
  total = total ? (total.to_s + node.val.to_s).to_i : node.val
  return total if leaf?(node.left, node.right)

  left_result = sum_root_to_leaf_helper(node.left, total)
  right_result = sum_root_to_leaf_helper(node.right, total)

  left_result + right_result
end

def leaf?(left_node, right_node)
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

p sum_root_to_leaf(root) #== (123 + 14)

# First attempt

# def sum_root_to_leaf(root)
#   root_value = root ? root.val : 0
#   sum_root_to_leaf_helper(root, root_value, root_value)
# end
#
# def sum_root_to_leaf_helper(node, prev_value, total)
#   return 0 if node.nil?
#
#   if is_leaf?(node.left, node.right)
#     return (prev_value.to_s + node.val.to_s).to_i
#   end
#
#   left_result = sum_root_to_leaf_helper(node.left, node.val, total)
#   right_result = sum_root_to_leaf_helper(node.right, node.val, total)
#
#   return left_result.to_s + right_result.to_s
# end
