class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def preorder_traversal(root)
  ordered_nodes = []
  stack = []
  tracker_node = root
  while tracker_node
    queue.push(tracker_node.right) if tracker_node.right
    queue.push(tracker_node.left) if tracker_node.left

    ordered_nodes.push(tracker_node.val)
    tracker_node = stack.pop
  end

  ordered_nodes
end

root = Node.new("1")

root.left = Node.new("2")
root.left.left = Node.new("4")
root.right = Node.new("3")

p preorder_traversal(root)
