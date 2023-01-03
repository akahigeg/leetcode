# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}

require "algorithms"
include Containers

# Runtime 1058 ms Beats 57.14%
# Memory 224.2 MB Beats 28.57%
def k_smallest_pairs(nums1, nums2, k)
  @nums1 = nums1
  @nums2 = nums2

  @queue = PriorityQueue.new
  pairs = []

  push(0, 0)
  while !@queue.empty? && pairs.size < k
    _, i, j = @queue.pop
    # p "i:#{i}, j:#{j}"
    pairs << [nums1[i], nums2[j]]
    push(i, j + 1)
    push(i + 1, 0) if j == 0
  end

  pairs
end

def push(i, j)
  return if @nums1[i].nil? || @nums2[j].nil?

  sum = @nums1[i] + @nums2[j]
  @queue.push([sum, i, j], -sum)
end

# TLE
def tle_k_smallest_pairs(nums1, nums2, k)
  nums1.product(nums2).sort { |p1, p2| p1.sum <=> p2.sum }[0...k]

  # pairs = []
  # nums1.each do |n1|
  #   nums2.each do |n2|
  #     pairs << [n1, n2]
  #   end
  # end

  # pairs.sort { |p1, p2| p1.sum <=> p2.sum }[0..k]
end

p k_smallest_pairs([1, 1, 2], [1, 2, 3], 10) # => [[1,1],[1,1],[2,1],[1,2],[1,2],[2,2],[1,3],[1,3],[2,3]]
p k_smallest_pairs([1, 7, 11], [2, 4, 6], 3)
p k_smallest_pairs([2, 4, 6], [1, 7, 11], 3)
p k_smallest_pairs([1, 1, 2], [1, 2, 3], 2)
p k_smallest_pairs([1, 2, 3], [1, 1, 2], 2)
p k_smallest_pairs([1, 2], [3], 3)
