class ListNode
  attr_accessor :val, :next

  def initialize(val, _next = nil)
    @val = val
    @next = _next
  end

  def to_array
    array = []
    current = self
    while current
      array << current.val
      current = current.next
    end

    array
  end
end

class Array
  def to_linked_list(is_cycle = false)
    head = nil
    prev = nil
    current = nil
    self.each do |n|
      current = ListNode.new(n)
      head ||= current
      prev.next = current if prev

      prev = current
    end

    if is_cycle
      current.next = head
    else
      head
    end
  end
end
