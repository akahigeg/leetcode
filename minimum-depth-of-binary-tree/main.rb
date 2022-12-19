# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}

require_relative "../lib/ruby-tree-node"

# Runtime 351 ms Beats 94.23%
# Memory 228.5 MB Beats 67.31%
def min_depth(root)
  return 0 if root.nil?

  depth = 0
  queue = [root]
  until queue.empty?
    depth += 1
    queue.size.times do
      node = queue.shift
      return depth if node.left.nil? && node.right.nil?

      queue << node.left if node.left
      queue << node.right if node.right
    end
  end
end

p (min_depth([3, 9, 20, nil, nil, 15, 7].to_tree))
p (min_depth([2, nil, 3, nil, 4, nil, 5, nil, 6].to_tree))
