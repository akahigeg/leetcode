# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
   n1 = get_linked_number(l1).reverse.to_i
   n2 = get_linked_number(l2).reverse.to_i

   (n1 + n2).to_s.split(//).map(&:to_i).reverse
end

def get_linked_number(listnode, number = "")
  return number if listnode.nil?

  number.to_s unless number.is_a?(String)
  number += listnode.val.to_s

  get_linked_number(listnode.next, number)
end

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

l1_3 = ListNode.new(9)
l1_2 = ListNode.new(4, l1_3)
l1 = ListNode.new(2, l1_2)

l2_4 = ListNode.new(9)
l2_3 = ListNode.new(4, l2_4)
l2_2 = ListNode.new(6, l2_3)
l2 = ListNode.new(5, l2_2)

p add_two_numbers(l1, l2)