# ref: https://leetcode.com/problems/kth-largest-element-in-a-stream/discuss/1172853/Ruby-Faster-100
class KthLargestWithNoHeap

  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @max_size = k
    @data = nums.sort.reverse[0...k]
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    if (i = @data.bsearch_index { |x| x < val })
      @data.insert(i, val)
    else
      @data.push(val)
    end
    @data.pop if @data.length > @max_size
    @data.last
  end
end

# TLE
require "algorithms"
include Containers

class KthLargest

  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @max_size = k
    @heap = MinHeap.new(nums)
    while @heap.size > @max_size
      @heap.pop
    end
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    @heap.push(val)
    @heap.pop if @heap.size > @max_size

    @heap.min
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
obj = KthLargest.new(3, [4, 5, 8, 2])
p obj.add(3) #=> 4 [8, 5, 4, 3, 2]
p obj.add(5) #=> 5 [8, 5, 5, 4, 3, 2]
p obj.add(10) #=> 5
p obj.add(9) #=> 8
p obj.add(4) #=> 8

obj = KthLargest.new(1, [])
p obj.add(-3)

obj = KthLargest.new(2, [0])
p obj.add(-1)
