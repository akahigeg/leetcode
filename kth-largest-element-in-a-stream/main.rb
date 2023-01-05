# Time Limit Exceeded
class KthLargest

  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @k = k
    @nums = nums.sort
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    # (@nums + [val]).sort[@k - 1]
    @nums << val
    @nums.sort! { |n1, n2| n2 <=> n1 }
    @nums[@k - 1]
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
obj = KthLargest.new(3, [4, 5, 8, 2])
p obj.add(3)
p obj.add(5)
p obj.add(10)
p obj.add(9)
p obj.add(4)
