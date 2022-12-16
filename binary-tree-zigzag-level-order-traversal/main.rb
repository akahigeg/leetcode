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

# 各レベルにnode.valを突っ込むタイミングと方法を修正して高速化
#   ループの回数を減らした（mapをなくした）
#   レベルのnode.valを最初から逆順で入れるようにした（あとでreverseするのをやめた）
#
# Runtime 75 ms Beats 94%
# Memory 210.9 MB Beats 76%
def zigzag_level_order(root)
  return [] if root.nil?

  levels = []
  queue = [root]

  until queue.empty?
    current_level = []
    is_reverse = levels.size.odd?

    queue.size.times do
      node = queue.shift
      if is_reverse
        current_level.unshift(node.val)
      else
        current_level << node.val
      end
      queue << node.left if node.left
      queue << node.right if node.right
    end

    levels << current_level
  end

  levels
end

# Runtime 105 ms Beats 82%
# Memory 211 MB Beats 50%
def zigzag_level_order_myfirst(root)
  return [] if root.nil?

  levels = []
  queue = [root]

  until queue.empty?
    if levels.size.even?
      levels << queue.map { |node| node.val }
    else
      levels << queue.map { |node| node.val }.reverse
    end

    queue.size.times do
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end

  levels
end

p zigzag_level_order([3, 9, 20, nil, nil, 15, 7].to_tree)
p zigzag_level_order([1].to_tree)
p zigzag_level_order([].to_tree)

p zigzag_level_order([1, 2, 3, 4, nil, nil, 5].to_tree)
