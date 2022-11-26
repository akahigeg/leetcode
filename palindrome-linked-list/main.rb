# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}

# Runtime: 445 ms, faster than 82.59% of Ruby online submissions for Palindrome Linked List.
# Memory Usage: 226.1 MB, less than 19.40% of Ruby online submissions for Palindrome Linked List.
#
# 後半を配列にしてないためメモリ節約になるかとおもいきやそうでもなかった
def is_palindrome(head)
  front_half_reverse = []

  # 前半分
  is_odd = true
  slow = fast = head
  while fast&.next
    front_half_reverse.unshift(slow.val)

    is_odd = false if fast.next.next.nil?

    fast = fast.next.next
    slow = slow.next
  end

  # 要素数が奇数ならslowを1つ進める 中央の値は比較対象から外すため
  slow = slow.next if is_odd

  # 後ろ半分
  while slow
    return false if front_half_reverse[i] != slow.val
    i += 1
    slow = slow.next
  end

  true
end

# これ遅いときもある
#
# Runtime: 418 ms, faster than 90.55% of Ruby online submissions for Palindrome Linked List.
# Memory Usage: 220.6 MB, less than 91.54% of Ruby online submissions for Palindrome Linked List.
def is_palindrome_two_pointer(head)
  front_half = []
  back_half_reverse = []

  size = 0

  # 前半分
  slow = fast = head
  while fast&.next
    front_half.push(slow.val)

    fast = fast.next.next
    slow = slow.next

    size += 1
  end

  # 後ろ半分
  while slow
    back_half_reverse.unshift(slow.val)
    slow = slow.next

    size += 1
  end

  # 連結リストの要素数が奇数だった場合は中央の1つを比較対象から外す
  back_half_reverse.pop if size.odd?

  # p "f:#{front_half}, br:#{back_half_reverse}"

  front_half == back_half_reverse
end

def is_palindrome_o_n_plus_n(head)
  # 計算量O(n+n)
  numbers = []
  current_node = head
  # O(n)
  until current_node.nil?
    numbers.push(current_node.val)
    current_node = current_node.next
  end
  numbers == numbers.reverse #O(n)
end

def is_palindrome_with_recursion(head)
  numbers = extract_numbers(head)

  numbers == numbers.reverse
end

def extract_numbers(node, numbers = [])
  return numbers if node.nil?

  numbers.push(node.val)

  extract_numbers(node.next, numbers)
end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

head = nil
[1, 2, 2, 1].reverse.each { |n| head = ListNode.new(n, head) }
p is_palindrome(head)

head = nil
[1, 2, 3, 2, 1].reverse.each { |n| head = ListNode.new(n, head) }
p is_palindrome(head)

head = nil
[1, 2, 1, 2].reverse.each { |n| head = ListNode.new(n, head) }
p is_palindrome(head)

head = nil
[1, 2].reverse.each { |n| head = ListNode.new(n, head) }
p is_palindrome(head)
