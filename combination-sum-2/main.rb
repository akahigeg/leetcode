# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}

# ref: https://leetcode.com/problems/combination-sum-ii/discuss/214410/Ruby-fast-solution
#
# Runtime: 107 ms, faster than 84.34% of Ruby online submissions for Combination Sum II.
# Memory Usage: 211 MB, less than 45.78% of Ruby online submissions for Combination Sum II.
def combination_sum2(candidates, target)
  candidates.sort!
  
  generate_combination_sum(candidates, target, 0)
end
  
def generate_combination_sum(candidates, target, combinations = [], combination = [], start)
  if target == 0
    combinations << combination.clone 
    return
  end
    
  # return if candidates[start].nil? || target < candidates[start]
  
  (start...candidates.length).each do |i|
    next if candidates[i] == candidates[i-1] && i > start
    break if candidates[i] > target
    
    combination << candidates[i]
    generate_combination_sum(candidates, target - candidates[i], combinations, combination, i+1)
    
    combination.pop
  end

  combinations
end

# p combination_sum2([1,2,1,5], 8)
p combination_sum2([10,1,2,7,6,1,5], 8)
p combination_sum2([2,5,2,1,2], 5)