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

# Runtime 94 ms Beats 85%
# Memory 211.4 MB Beats 56.82%
def max_depth(root)
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
