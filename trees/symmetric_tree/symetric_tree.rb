class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def symmetric_tree(node)
  left, right = node.left, node.right
  left_result = pre_order(left)
  right_result = pre_order_mod(right)

  left_result == right_result
end

def pre_order(node)
  return [] if node.nil?
  results = []
  results << node.val
  results.concat pre_order(node.left)
  results.concat pre_order(node.right)
  results
end

def pre_order_mod(node)
 return [] if node.nil?
 results = []
 results << node.val
 results.concat pre_order(node.right)
 results.concat pre_order(node.left)
 results
end

# def post_order(node)
#   return [] if node.nil?
#   results = []
#   results.concat post_order(node.left)
#   results.concat post_order(node.right)
#   results << node.val
#   results
# end

root = Node.new("1")

# first level
root.left = Node.new("2")
root.right = Node.new("2")

# second level
root.left.left = Node.new("4")
root.left.right = Node.new("3")

root.right.right = Node.new("4")
root.right.left = Node.new("3")


p symmetric_tree(root)
