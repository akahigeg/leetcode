# Definition for Node.
class Node
  attr_accessor :val, :left, :right, :next

  def initialize(val)
    @val = val
    @left, @right, @next = nil, nil, nil
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

    root = Node.new(self[0])

    grow_tree_child(self, root, 0)

    root
  end

  def grow_tree_child(array, current, current_index)
    return if current.nil?

    left_index = current_index * 2 + 1
    right_index = current_index * 2 + 2

    current.left = array[left_index].nil? ? nil : Node.new(array[left_index])
    grow_tree_child(array, current.left, left_index)

    current.right = array[right_index].nil? ? nil : Node.new(array[right_index])
    grow_tree_child(array, current.right, right_index)
  end
end

# @param {Node} root
# @return {Node}
def connect(root)
  return root if root.nil?

  queue = [root]
  until queue.empty?
    level_size = queue.size

    level_size.times do |i|
      node = queue.shift

      node.next = queue[0] if i < level_size - 1

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  root
end

p connect([1, 2, 3, 4, 5, 6, 7].to_tree).to_a
