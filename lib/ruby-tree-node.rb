class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def to_a
    array = []
    queue = [self]
    until queue.empty?
      node = queue.shift
      array << node.val

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end

    array
  end
end

class Array
  def to_tree
    return nil if self.empty?

    root = TreeNode.new(self[0])

    grow_tree_child(self, root, 0)

    root
  end

  def grow_tree_child(array, current, current_index)
    return if current.nil?

    left_index = current_index * 2 + 1
    right_index = current_index * 2 + 2

    current.left = array[left_index].nil? ? nil : TreeNode.new(array[left_index])
    grow_tree_child(array, current.left, left_index)

    current.right = array[right_index].nil? ? nil : TreeNode.new(array[right_index])
    grow_tree_child(array, current.right, right_index)
  end
end
