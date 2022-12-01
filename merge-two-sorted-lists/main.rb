# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}


# Runtime: 151 ms, faster than 60.80% of Ruby online submissions for Merge Two Sorted Lists.
# Memory Usage: 211.1 MB, less than 52.96% of Ruby online submissions for Merge Two Sorted Lists.
def merge_two_lists(list1, list2)
  merged_head = ListNode.new(-1)

  merged = merged_head
  while list1 && list2
    # 配列をshiftしていくイメージ
    if list1.val <= list2.val
      merged.next = list1
      list1 = list1.next
    else
      merged.next = list2
      list2 = list2.next
    end
    merged = merged.next
  end
  
  if list1.nil?
    merged.next = list2
  else
    merged.next = list1
  end

  merged_head.next
end


# ref: https://leetcode.com/problems/merge-two-sorted-lists/discuss/2172201/Ruby-Recursion
# 
# Runtime: 81 ms, faster than 95.41% of Ruby online submissions for Merge Two Sorted Lists.
# Memory Usage: 210.9 MB, less than 87.38% of Ruby online submissions for Merge Two Sorted Lists.
def merge_two_lists_recursive(list1, list2)
   return list1 unless list2
   return list2 unless list1  
   if list1.val < list2.val
       list1.next = merge_two_lists(list1.next, list2)
       list1
   else
       list2.next = merge_two_lists(list1, list2.next)
       list2
   end
end

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def array_to_list(array)
  list = nil
  array.reverse.each do |i|
    list = ListNode.new(i, list)
  end

  list
end


p merge_two_lists(array_to_list([1,2,3]), array_to_list([1,3,4]))