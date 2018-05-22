class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

# Works, but less intuitive than bst_insert.rb. Whether the node is > or < the root should drive the algorithm's logic.

def bst_insert(root, node)
  if !root.left
    if node.val < root.val
      root.left = node
      return
      # needs a return statement because execution may continues - imagine inserting a 0 into a tree with a lot of right nodes. `if !root.right -> bst_insert(root.right, node)` would make it so that it would try to insert 0 on the right side of the tree
    end
  else
    bst_insert(root.left, node)
  end

  if !root.right
    if node.val > root.val
      root.right = node
    end
  else
    bst_insert(root.right, node)
  end

  root
end

root = Node.new("1")
bst_insert(root, Node.new("2"))
p root.right.val == "2"

bst_insert(root, Node.new("3"))
p root.right.right.val == "3"


bst_insert(root, Node.new("5"))
p root.right.right.right.val == "5"

# handles duplicates
bst_insert(root, Node.new("5"))
p root.right.right.right.right.nil? && root.right.right.right.left.nil?

bst_insert(root, Node.new("0"))
p root.left.val == "0"

p root
