class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def bst_insert(root, node)
  if node.val > root.val
    if root.right
      bst_insert(root.right, node)
    else
      root.right = node
    end
  else
    if root.left
      bst_insert(root.left, node)
    else
      root.left = node
    end
  end

  root
end

# Divide and Conquer approach

# return node
# if conditional for which is the correct branch 
  # either root.left = insert node bst left
  # or root.right = insert node bst right

root = Node.new("1")
root.left = Node.new("2")

bst_insert(root, Node.new("3"))
p root.right.val == "3"

bst_insert(root, Node.new("5"))
p root.right.right.val == "5"
