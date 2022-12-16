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

# ref: https://leetcode.com/problems/binary-tree-level-order-traversal/solutions/2283024/bfs-in-ruby/
# Runtime 92 ms Beats 86.70%
# Memory 211.2 MB Beats 16.75%
def level_order(root)
  return [] if root.nil?

  levels = []
  queue = [root]

  until queue.empty?
    levels << queue.map { |node| node.val }

    queue.size.times do
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end

  levels
end

# Runtime 88 ms Beats 90.15%
# Memory 211.1 MB Beats 16.75%
def level_order_recurse(root)
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
p level_order([3, 9, 20, 7, 10, 15, 21].to_tree)
