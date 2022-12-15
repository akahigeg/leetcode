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
# @return {Integer[][]}

require_relative "../lib/ruby-tree-node"

# Runtime 88 ms Beats 90.15%
# Memory 211.1 MB Beats 16.75%
def level_order(root)
  levels = []
  traversal(root, levels)

  levels
end

def traversal(node, levels, current_level = 0)
  return if node.nil?

  levels[current_level] ||= []
  levels[current_level] << node.val

  traversal(node.left, levels, current_level + 1)
  traversal(node.right, levels, current_level + 1)
end

p level_order([3, 9, 20, nil, nil, 15, 7].to_tree)
