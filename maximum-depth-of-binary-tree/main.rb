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

# ref: https://leetcode.com/problems/maximum-depth-of-binary-tree/solutions/176802/maximum-depth-of-binary-tree/?orderBy=most_relevant
# Solusion 3
#
# Runtime 94 ms Beats 85%
# Memory 211.5 MB Beats 32.27%
def max_depth(root)
  return 0 if root.nil?

  stack = []

  stack << [1, root]
  max_depth = 0
  until stack.empty?
    current_depth, node = stack.pop

    max_depth = [max_depth, current_depth].max
    stack << [current_depth + 1, node.left] if node.left
    stack << [current_depth + 1, node.right] if node.right
  end

  max_depth
end

# ref: https://leetcode.com/problems/maximum-depth-of-binary-tree/solutions/176802/maximum-depth-of-binary-tree/?orderBy=most_relevant
# Solusion 1
#
# Runtime 88 ms Beats 89.9%
# Memory 211.3 MB Beats 80.91%
def max_depth_by_recursion(root)
  return 0 if root.nil?

  left = max_depth(root.left)
  right = max_depth(root.right)

  [left, right].max + 1
end

# 自力で解いたやり方
#
# Runtime 94 ms Beats 85%
# Memory 211.4 MB Beats 56.82%
def max_depth_by_queue(root)
  return 0 if root.nil?

  level_count = 0
  queue = [root]
  until queue.empty?
    level_count += 1

    queue.size.times do
      node = queue.shift

      queue << node.left if node.left
      queue << node.right if node.right
    end
  end

  level_count
end

p max_depth([3, 9, 20, nil, nil, 15, 7].to_tree)
p max_depth([1, nil, 2].to_tree)
