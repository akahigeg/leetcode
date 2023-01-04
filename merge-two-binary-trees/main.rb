# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}

require_relative "../lib/ruby-tree-node"

# Runtime: 301 ms, faster than 6.67% of Ruby online submissions for Merge Two Binary Trees.
# Memory Usage: 211.5 MB, less than 56.67% of Ruby online submissions for Merge Two Binary Trees.
def merge_trees(root1, root2)
  return root1 if root2.nil?
  return root2 if root1.nil?

  root1.val += root2.val
  root1.left = merge_trees(root1.left, root2.left)
  root1.right = merge_trees(root1.right, root2.right)

  root1
end

p merge_trees([1, 3, 2, 5].to_tree, [2, 1, 3, nil, 4, nil, 7].to_tree)

# root = [1, 2, 3, 5, nil, 4, 7, 8, nil].to_tree
# queue = [[root, 1]]
# while !queue.empty?
#   node, level = queue.shift
#   p "level: #{level}, val: #{node.val}"

#   queue << [node.left, level + 1] unless node.left.nil?
#   queue << [node.right, level + 1] unless node.right.nil?
# end
