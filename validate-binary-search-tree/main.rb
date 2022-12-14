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
# @return {Boolean}

require_relative "../lib/ruby-tree-node"

# Runtime 96 ms Beats 91.82%
# Memory 211.7 MB Beats 38.36%
def is_valid_bst(root)
  validate(root)
end

def validate(node, low = -Float::INFINITY, high = Float::INFINITY)
  return true if node.nil?

  return false if node.val <= low || node.val >= high

  validate(node.left, low, node.val) && validate(node.right, node.val, high)

  # 左に行くときlowは更新されずhighは現在のnodeのものとなる
  #   左の子ノードの子孫に現在のnode以上の値が絶対に含まれないように
  #   左に降りていくときノードは親の親より必ず小さい

  # 右にいくときhighは更新されずlowは現在のnodeのものとなる
  #   右の子ノードの子孫に現在のnode以下の値が絶対に含まれないように
  #   右に降りていくときノードは親の親より必ず大きい
end

p is_valid_bst([1, 2].to_tree)
p is_valid_bst([2, 1].to_tree)
p is_valid_bst([2, 1, 3].to_tree)
p is_valid_bst([2, 2, 2].to_tree)
p is_valid_bst([5, 4, 6, nil, nil, 3, 7].to_tree)
