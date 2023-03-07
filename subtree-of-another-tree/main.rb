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
# @param {TreeNode} sub_root
# @return {Boolean}

require_relative "../lib/ruby-tree-node"

# ref: https://leetcode.com/problems/subtree-of-another-tree/solution/
# Runtime: 124 ms, faster than 96.97% of Ruby online submissions for Subtree of Another Tree.
# Memory Usage: 211.4 MB, less than 6.06% of Ruby online submissions for Subtree of Another Tree.
def is_subtree(root, sub_root)
  r = []
  serialize(root, r)
  p r.join

  s = []
  serialize(sub_root, s)
  p s.join

  r.join.include?(s.join)
end

def serialize(node, array)
  if node.nil?
    array << "#"
    return
  end

  array << "^"
  array << node.val.to_s
  serialize(node.left, array)
  serialize(node.right, array)
end

p is_subtree([3, 4, 5, 1, 2].to_tree, [4, 1, 2, 1].to_tree) # => false
p is_subtree([1, 1, 1].to_tree, [1].to_tree) #=> true
p is_subtree([1, 1].to_tree, [1].to_tree) #=> true
p is_subtree([3, 4, 5, 1, 2].to_tree, [4, 1, 2].to_tree) #=> true
p is_subtree([3, 4, 5, 1, 2, nil, nil, nil, nil, 0].to_tree, [4, 1, 2].to_tree) #=> false
