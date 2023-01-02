# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

# Runtime 95 ms Beats 81.36%
# Memory 211.4 MB Beats 33.90%
def intersection(nums1, nums2)
  nums1.intersection(nums2)
end

p intersection([1, 2, 2, 1], [2, 2])
p intersection([4, 9, 5], [9, 4, 9, 8, 4])
