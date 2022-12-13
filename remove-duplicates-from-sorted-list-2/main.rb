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

# ref: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/solutions/952302/remove-duplicates-from-sorted-list-ii/?orderBy=most_relevant
#
# Runtime 203 ms Beats 15.15%
# Memory 211 MB Beats 51.52%
def delete_duplicates(head)
  # headの値が重複だった場合に排除するのに、headの前にノードを追加するアイデアを思いつけなかった
  # それ以外は自力でできていたので悔しい
  sentinel = ListNode.new(0, head)

  prev = sentinel
  current = head

  while current
    if current.next && current.val == current.next.val
      while current.next && current.val == current.next.val
        current = current.next
      end

      prev.next = current.next
    else
      prev = prev.next
    end

    current = current.next
  end

  sentinel.next
end

def uniq(head)
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
p delete_duplicates([1, 1, 1, 2, 3, 3, 4, 4, 5].to_linked_list).to_array
p delete_duplicates([1].to_linked_list).to_array
p delete_duplicates([1, 1, 2].to_linked_list).to_array
