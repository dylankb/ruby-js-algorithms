#        3
#       / \
#      9   20
#     /\   /  \
#   8  10   15   7
#
# [
#   [3],
#   [9,20],
#   [8,10, 15,7]
# ]
#
# # Set root as tracker_node
#
# []                        [[3]]                        []       3 <- tracker_node
# # Add root to processing_queue in new array
#
# [[9,20]]                  [[3]]                        []
# # For each item in processing queue
# #   1) Add children to temp_result
#
# [[9,20]]                  []                           [[3]]
# #   2) Add to results
#
#
# [[20]]                        [[9]]                       [[3]]   9 <- tracker_node
# # Set first child as tracker_node
#
#
#
# []                        [[9, 20]]                    [[3]]
# # Move children to processing queue
#
# []                        [[9, 20]]                    [[3]]   9 <- tracker_node
# # Set first child as tracker_node
#
# [[8,10, 15,7]]            [[9, 20]]                    [[3]]
# # For each item in processing queue
# #   1) add children to temp_result
# #   add to result

class Node
  attr_accessor :left, :right
  attr_reader :val
  def initialize(val)
    @val = val
  end
end

def level_traversal(root)
  queue = [root]
  result = []
  current_level = 0
  while !queue.empty?
    queue.size.times do
      node = queue.shift
      result[current_level] = [] unless result[current_level]
      result[current_level] << node.val  # Process node
      queue.push(node.left) if node.left # Move children to queue
      queue.push(node.right) if node.right
    end
    current_level += 1
  end
  result
end

root = Node.new("3")

root.left = Node.new("9")
root.right = Node.new("20")

root.left.left = Node.new("8")
root.left.right = Node.new("10")
root.right.left = Node.new("15")
root.right.right = Node.new("7")
p level_traversal(root)
