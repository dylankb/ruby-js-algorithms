class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

# Binary tree

#      I
#    /   \
#   O     H
#  / \   / \
# L  R  T  M
#    /\
#   A G

root = Node.new("I")

# first level
root.left = Node.new("O")
root.right = Node.new("H")

# second level
root.left.left = Node.new("L")
root.left.right = Node.new("R")
root.right.left = Node.new("T")
root.right.right = Node.new("M")

# third level
root.left.left.left = Node.new("A")
root.left.left.right = Node.new("G")

# Another binary tree

#     1
#    / \
#   2   3
#  / \ / \
# 4  5


root2 = Node.new("1")

# first level
root2.left = Node.new("2")
root2.right = Node.new("3")

# second level
root2.left.left = Node.new("4")
root2.left.right = Node.new("5")

def in_order(node)
  return [] if node.nil?
  results = []
  results.concat in_order(node.left)
  results << node.val
  results.concat in_order(node.right)
  results
end

p in_order(root2) == ["4", "2", "5", "1", "3"]

def pre_order(node)
 return [] if node.nil?
 results = []
 results << node.val
 results.concat pre_order(node.left)
 results.concat pre_order(node.right)
 results
end

p pre_order(root2) == ["1", "2", "4", "5", "3"]
p pre_order(root) == ["I", "O", "L", "A", "G", "R", "H", "T", "M"]

def post_order(node)
  return [] if node.nil?
  results = []
  results.concat post_order(node.left)
  results.concat post_order(node.right)
  results << node.val
  results
end

p post_order(root2) == ["4", "5", "2", "3", "1"]
