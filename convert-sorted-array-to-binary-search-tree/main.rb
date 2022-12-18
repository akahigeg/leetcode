# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}

require_relative "../lib/ruby-tree-node"

# Runtime 135 ms Beats 98.63%
# Memory 278 MB Beats 31.51%
def sorted_array_to_bst(nums)
  array_to_tree(nums, 0, nums.size - 1)
end

def array_to_tree(nums, head, tail)
  return nil if head > tail

  center = (tail + head) / 2
  node = TreeNode.new(nums[center])

  node.left = array_to_tree(nums, head, center - 1)
  node.right = array_to_tree(nums, center + 1, tail)

  node
end

p sorted_array_to_bst([-10, -3, 0, 5, 9])
