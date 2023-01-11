# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
require_relative "../lib/ruby-linked-list"

# Runtime: 88 ms, faster than 73.44% of Ruby online submissions for Remove Nth Node From End of List.
# Memory Usage: 211 MB, less than 83.59% of Ruby online submissions for Remove Nth Node From End of List.
def remove_nth_from_end(head, n)
  seq = []
  current = head
  until current.nil?
    seq << current
    current = current.next
  end

  return head.next if seq[-n] == seq[0]

  nth_index = seq.size - n
  nth_prev_index = nth_index - 1
  nth_next_index = nth_index + 1
  if seq[nth_prev_index].nil?
    head = seq[nth_next_index]
  else
    seq[nth_prev_index].next = seq[nth_next_index]
  end

  head.nil? ? [] : head
end

p remove_nth_from_end([1, 2, 3, 4, 5].to_linked_list, 2)
p remove_nth_from_end([1].to_linked_list, 1)
p remove_nth_from_end([1, 2].to_linked_list, 2)
p remove_nth_from_end([1, 2].to_linked_list, 1)
