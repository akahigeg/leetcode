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

# ref: https://leetcode.com/problems/split-bst/solution/
# Runtime: 140 ms, faster than 100.00% of Ruby online submissions for Split BST.
# Memory Usage: 211.1 MB, less than 100.00% of Ruby online submissions for Split BST.
def split_bst(root, target)
  return [nil, nil] if root.nil?

  if root.val <= target
    bns = split_bst(root.right, target)
    root.right = bns[0]

    [root, bns[1]]
  else
    bns = split_bst(root.left, target)
    root.left = bns[1]

    [bns[0], root]
  end
end

# 解けず
# 与えられるrootが二分探索木なら解ける
def my_split_bst(root, target)
  new_root = nil

  queue = [root]
  parent_node = nil
  until queue.empty?
    node = queue.shift

    if node.val == target
      new_root = node

      # targetがrootだった場合 rootの右の子を新しいrootにする
      if parent_node.nil?
        if node.left.nil? && node.right.nil?
          root = nil
        elsif node.left.nil?
          root = node.right
          new_root.right = nil
        elsif node.right.nil?
          root = node.left
          new_root.left = nil
        end
      else
        if new_root.val == parent_node.left.val
          parent_node.left = nil
          unless new_root.right.nil?
            parent_node.left = new_root.right
            new_root.right = nil
          end
        elsif new_root.val == parent_node.right.val
          parent_node.right = nil
          unless new_root.right.nil?
            parent_node.right = new_root.right
            new_root.right = nil
          end
        end
      end

      break
    end

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?

    parent_node = node
  end

  [new_root.to_a, root.to_a]
end

p split_bst([4, 2, 6, 1, 3, 5, 7].to_tree, 2)
p split_bst([1].to_tree, 1)
p split_bst([1, 2].to_tree, 1)
trees = split_bst([10, 5, 20, 3, 9, 15, 25, nil, nil, 8, nil, nil, nil, nil, nil, 6, nil, nil, 7].to_tree, 6)
p trees[0].to_a
p trees[1].to_a

# Input
# [10,5,20,3,9,15,25,null,null,8,null,null,null,null,null,6,null,null,7]
# 6
# Output
# [[6],[10,5,20,3,9,15,25,null,null,8,null,null,null,null,null,7]]
# Expected
# [[5,3,6],[10,9,20,8,null,15,25,7]]
