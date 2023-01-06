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

  [new_root, root]
end

p split_bst([4, 2, 6, 1, 3, 5, 7].to_tree, 2)
p split_bst([1].to_tree, 1)
p split_bst([1, 2].to_tree, 1)
