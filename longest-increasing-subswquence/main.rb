# @param {Integer[]} nums
# @return {Integer}

# ref: https://leetcode.com/problems/longest-increasing-subsequence/solutions/1051649/ruby-o-nlogn-solution/
# O(n log n)
def length_of_lis(nums)
  nums.reduce([]) { |dp, x|
    p "x: #{x}"
    dp[dp.bsearch_index { |y| y >= x } || dp.size] = x
    dp
  }.size
end

# ref: https://leetcode.com/problems/longest-increasing-subsequence/solutions/1281811/longest-increasing-subsequence/?orderBy=most_relevant
#
# O(n**2)
#
# Runtime 1405 ms Beats 35.48%
# Memory 211.6 MB Beats 19.35%
def length_of_lis_dp(nums)
  dp = Array.new(nums.size, 1)

  i = 0
  while i < nums.size
    j = 0
    while j < i
      dp[i] = [dp[i], dp[j] + 1].max if nums[i] > nums[j]
      j += 1
    end
    i += 1
  end

  dp.max
end

p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18])
p length_of_lis([0, 1, 0, 3, 2, 3])
p length_of_lis([7, 7, 7, 7, 7, 7, 7])

p [1, 2, 3, 4, 5].bsearch_index { |y| y == 3 }
