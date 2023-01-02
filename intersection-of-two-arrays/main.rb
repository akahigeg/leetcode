# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

require "set"

# Runtime 95 ms Beats 81.36%
# Memory 211.4 MB Beats 33.90%
def my_intersection(nums1, nums2)
  nums1.intersection(nums2)
end

# Runtime 100 ms Beats 76.27%
# Memory 211.5 MB Beats 15.25%
def intersection(nums1, nums2)
  s1 = Set.new(nums1)
  s2 = Set.new(nums2)

  if s1.size > s2.size
    set_intersection(s1, s2)
  else
    set_intersection(s2, s1)
  end
end

def set_intersection(s1, s2)
  s1.delete_if { |n| !s2.include?(n) }.to_a
end

p intersection([1, 2, 2, 1], [2, 2])
p intersection([4, 9, 5], [9, 4, 9, 8, 4])
