# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  index1 = 0
  index2 = 0

  pairs = []

  loop do
    pairs << [nums1[index1], nums2[index2]]

    break if pairs.size == k

    if nums1[index1] == nums2[index2]
      if nums2[index2 + 1]
        index2 += 1
      else
        index1 += 1
      end
    else
      if nums1[index1] < nums2[index2]
        index2 += 1
        if nums2[index2].nil?
          index2 -= 1
          index1 += 1
        end
      else
        index1 += 1
        if nums1[index1].nil?
          index1 -= 1
          index2 += 1
        end
      end
    end

    break if nums1[index1].nil? || nums2[index2].nil?
  end

  pairs
end

p k_smallest_pairs([1, 1, 2], [1, 2, 3], 10) # => [[1,1],[1,1],[2,1],[1,2],[1,2],[2,2],[1,3],[1,3],[2,3]]
p k_smallest_pairs([1, 7, 11], [2, 4, 6], 3)
p k_smallest_pairs([2, 4, 6], [1, 7, 11], 3)
p k_smallest_pairs([1, 1, 2], [1, 2, 3], 2)
p k_smallest_pairs([1, 2, 3], [1, 1, 2], 2)
p k_smallest_pairs([1, 2], [3], 3)
