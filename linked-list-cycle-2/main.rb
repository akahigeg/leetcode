# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}

# Runtime 1606 ms Beats 6.86%
# Memory 297 MB Beats 8.82%
def detectCycle_use_visited(head)
  node = head
  visited = {}
  while node
    return node if visited.keys.include?(node)

    visited[node] = true
    node = node.next
  end

  nil
end

def detectCycle(head)
  return nil unless head

  intersect = findIntersect(head)
  return nil unless intersect

  pointer1 = head
  pointer2 = intersect
  while pointer1 != pointer2
    pointer1 = pointer1.next
    pointer2 = pointer2.next
  end

  pointer1
end

def findIntersect(head)
  fast = slow = head
  while fast&.next
    fast = fast.next.next
    slow = slow.next

    return slow if fast == slow
  end

  nil
end

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class Array
  def to_linked_list
    head = nil
    prev = nil
    current = nil
    self.each do |n|
      current = ListNode.new(n)
      head ||= current
      prev.next = current if prev

      prev = current
    end
    current.next = head
  end
end

head = [3, 2, 0, -4].to_linked_list
head.next.next.next = head.next

p detectCycle(head)

p detectCycle(ListNode.new(1))

head = [1, 2].to_linked_list
head.next.next = head

p detectCycle(head)
