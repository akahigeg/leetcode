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

require_relative "../lib/ruby-linked-list"

def delete_duplicates(head)
  current = head

  while current && current.next
    # 値が違えばcurrentを移動して次へ
    if current.val != current.next.val
      current = current.next
      next
    end

    # 値が同じならcurrentはそのままでnextをひとつ飛ばす
    current.next = current.next.next
  end

  head
end

p delete_duplicates([1, 2, 3, 3, 4, 4, 5].to_linked_list).to_array
