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

# Runtime 83 ms Beats 94.8%
# Memory 211.2 MB Beats 49.86%
def reverse_list(head)
  return nil if head.nil?

  current = head
  prev = nil
  while current
    nxt = current.next
    current.next = prev
    prev = current
    current = nxt
  end

  prev
end

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def to_str
    @val
  end
end

head = nil
prev = nil
(1..5).each do |i|
  node = ListNode.new(i, nil)
  head ||= node
  prev.next = node if prev

  prev = node
end

p reverse_list(head)
