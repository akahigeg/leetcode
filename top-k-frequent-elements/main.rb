# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}

# Runtime 103 ms Beats 85.71%
# Memory 211.8 MB Beats 97.48%
def top_k_frequent(nums, k)
  i = 0
  counts = {}
  while i < nums.size
    counts[nums[i]] ||= 0
    counts[nums[i]] += 1
    i+=1
  end

  counts.sort{|c1, c2| c2[1] <=> c1[1]}.map{|n,count| n }[0...k]
end

p top_k_frequent([1,1,1,2,2,3], 2)
p top_k_frequent([1,3,3,2,2,3], 2)
p top_k_frequent([1], 1)