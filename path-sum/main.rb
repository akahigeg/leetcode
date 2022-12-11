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
# @param {Integer} target_sum
# @return {Boolean}

# Runtime 147 ms Beats 57.63%
# Memory 211.2 MB Beats 71.19%
def has_path_sum(root, target_sum)
  return false if root.nil?

  target_sum -= root.val

  return target_sum == 0 if root.left.nil? && root.right.nil?

  has_path_sum(root.left, target_sum) || has_path_sum(root.right, target_sum)
end

def vertical_sum(node, target_sum, current_sum = 0)
  current_sum += node.val

  is_terminate = node.left.nil? && node.right.nil?
  # p "#{node.val}, #{current_sum}, is_terminate: #{is_terminate}"
  # 合計がtarget_sumかつ終端ならtrue
  if current_sum == target_sum && is_terminate
    return is_terminate
  end

  return true if node.left && vertical_sum(node.left, target_sum, current_sum)
  return true if node.right && vertical_sum(node.right, target_sum, current_sum)

  false
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def array_to_tree(array)
  return nil if array.empty?

  root = TreeNode.new(array[0])

  grow_child(array, root, 0)

  root
end

def grow_child(array, current, current_index)
  return if current.nil?

  left_index = current_index * 2 + 1
  right_index = current_index * 2 + 2

  current.left = array[left_index].nil? ? nil : TreeNode.new(array[left_index])
  grow_child(array, current.left, left_index)

  current.right = array[right_index].nil? ? nil : TreeNode.new(array[right_index])
  grow_child(array, current.right, right_index)
end

tree = array_to_tree([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1])
p has_path_sum(tree, 22)

tree = array_to_tree([1, 2, 3])
p has_path_sum(tree, 5)

tree = array_to_tree([])
p has_path_sum(tree, 0)

tree = array_to_tree([1, 2])
p has_path_sum(tree, 1)

tree = array_to_tree([-2, nil, -3])
p has_path_sum(tree, -2)

tree = array_to_tree([1, -2, -3, 1, 3, -2, nil, -1])
p has_path_sum(tree, -1)
