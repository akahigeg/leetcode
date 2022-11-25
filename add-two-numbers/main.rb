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
  add_two_numbers_by_digit(l1, l2, 0)

  # 数値にして足して、それからまた裏返すアプローチ 遅いが分かりやすさがある
  # n1 = get_linked_number(l1).reverse.to_i
  # n2 = get_linked_number(l2).reverse.to_i
  # (n1 + n2).to_s.split(//).map(&:to_i).reverse
end

# 参考: https://leetcode.com/problems/add-two-numbers/discuss/2279248/Ruby-solution
def add_two_numbers_by_digit(node1, node2, moveup)
  if node1.nil? && node2.nil?
    return moveup == 0 ? nil : ListNode.new(moveup)
  end

  digit_sum = (node1&.val || 0) + (node2&.val || 0) + moveup

  if digit_sum >= 10
    moveup = 1
    digit_sum -= 10
  else
    moveup = 0
  end

  ListNode.new(digit_sum, add_two_numbers_by_digit(node1&.next, node2&.next, moveup))
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