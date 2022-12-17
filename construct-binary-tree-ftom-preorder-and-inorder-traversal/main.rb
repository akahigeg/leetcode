# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}

require_relative "../lib/ruby-tree-node"

# ref: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solutions/1102530/construct-binary-tree-from-preorder-and-inorder-traversal/?orderBy=most_relevant
# Runtime 95 ms Beats 98.65%
# Memory 212.1 MB Beats 67.57%
def build_tree(preorder, inorder)
  @preorder = preorder
  @preorder_index = 0
  @inorder_index_map = {}
  inorder.each_with_index do |n, i|
    @inorder_index_map[n] = i
  end

  array_to_tree(0, preorder.size - 1)
end

def array_to_tree(head, tail)
  return nil if head > tail

  val = @preorder[@preorder_index]
  return nil unless @inorder_index_map[val]
  @preorder_index += 1
  node = TreeNode.new(val)

  node.left = array_to_tree(head, @inorder_index_map[val] - 1)
  node.right = array_to_tree(@inorder_index_map[val] + 1, tail)

  node
end

p build_tree([3, 10, 20, 9, 12, 15, 7], [9, 10, 12, 3, 15, 20, 7])
p build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
p build_tree([-1], [-1])
