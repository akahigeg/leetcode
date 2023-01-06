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
# @param {Integer} target
# @return {TreeNode[]}

require_relative "../lib/ruby-tree-node"

def split_bst(root, target)
  split_root = root.left
  root.left = nil

  if split_root.right
    root.left = split_root.right
    split_root.right = nil
  end

  [split_root.to_a, root.to_a]
end

p split_bst([4, 2, 6, 1, 3, 5, 7].to_tree, 2)
