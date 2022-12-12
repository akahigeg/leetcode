# @param {Integer[]} nums
# @return {Integer[][]}

# Runtime 142 ms Beats 64.86%
# Memory 211 MB Beats 89.19% (ソートを入れてたとき Memory 211.1 MB Beats 29.73%)
def subsets(nums)
  sets = [[]]

  (0...nums.size).each do |i|
    num = nums[i]
    sets = sets + sets.map { |set| set + [num] }
  end

  sets
end

# combinationメソッドをつかったケース
#
# ref: https://leetcode.com/problems/subsets/submissions/858429692/
# Runtime 96 ms Beats 78.38%
# Memory 211.1 MB Beats 29.73%
def subsets_with_combination(nums)
  ans = []
  (0..nums.size).each do |size|
    ans += nums.combination(size).to_a
  end
  ans
end

p subsets([1, 2, 3])

# [1,2,3,4]
# [1], [1,2], [1,3], [1,4], [1,2,3], [1,2,4], [1,3,4], [1,2,3,4]
# [2], [2,3], [2,4], [2,3,4]
# [3], [3,4]
# [4]
# [1]
# [2], [1,2]
# [3], [1,3], [2,3], [1,2,3]
# [4], [1,4], [2,4], [3,4], [1,2,4], [1,3,4], [2,3,4], [1,2,3,4]
# [5], [1,5], [2,5], [3,5], [4,5], [1,2,5], [1,3,5], [1,4,5], [2,3,5], [2,4,5], [3,4,5], [1,2,3,5], [2,3,4,5], [1,2,3,4,5]
