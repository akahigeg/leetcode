# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  fast = slow = head
  while fast&.next
    fast = fast.next.next
    slow = slow.next

    return true if fast == slow
  end

  false
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

p hasCycle(head)

p hasCycle(ListNode.new(1))

head = [1, 2].to_linked_list
head.next.next = head

p hasCycle(head)
