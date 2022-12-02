# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}

# ref: https://leetcode.com/problems/combination-sum/discuss/2851547/Ruby-Solution
#
# Runtime: 110 ms, faster than 89.12% of Ruby online submissions for Combination Sum.
# Memory Usage: 211.1 MB, less than 70.75% of Ruby online submissions for Combination Sum.
def combination_sum(candidates, target)
    sums = []
    find_sums(candidates, target, sums, [], 0)
    sums
end

def find_sums(candidates, target, sums, current, start)
    return if target < 0

    if target == 0
        sums << current.clone
        return
    end

    # p candidates[start..(candidates.size - 1)]
    # candidates[start..(candidates.size - 1)].each_with_index do |n, i|
    (start..(candidates.size - 1)).each do |i|
      n = candidates[i]
      current << n
      find_sums(candidates, target - n, sums, current, i)
      current.pop
    end
end

p combination_sum([2,3,6,7], 7)
p combination_sum([2,3,5], 8)
p combination_sum([2], 1)