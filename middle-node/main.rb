# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

# Runtime: 155 ms, faster than 36.89% of Ruby online submissions for Middle of the Linked List.
# Memory Usage: 211 MB, less than 43.52% of Ruby online submissions for Middle of the Linked List.
def middle_node(head)
  slow = fast = head
  while fast&.next
    fast = fast.next.next
    slow = slow.next
  end

  return slow
end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

p middle_node
