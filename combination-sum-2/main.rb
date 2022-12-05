# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}

# ref: https://leetcode.com/problems/combination-sum-ii/discuss/214410/Ruby-fast-solution
#
# Runtime: 107 ms, faster than 84.34% of Ruby online submissions for Combination Sum II.
# Memory Usage: 211 MB, less than 45.78% of Ruby online submissions for Combination Sum II.
def combination_sum2(candidates, target)
  candidates.sort!
  
  # find_combinations(candidates, target, 0).map{|c| c.sort }.uniq 最後にuniqは時間切れになる
  find_combinations(candidates, target, 0)
end
  
def find_combinations(candidates, target, combinations = [], combination = [], start)
  if target == 0
    combinations << combination.clone 
    return
  end
  
  (start...candidates.length).each do |i|
    n = candidates[i]

    # 同じ数の連続があった場合、先頭のひとつだけを取る。これがなんで重複の解決策になるのかよく分からん
    # => 再帰が進めばいずれ足し算されていくので、スキップするということ？意外とアドホックなやり方なのかも
    next if n == candidates[i-1] && i > start 

    break if n > target
    
    combination << n
    find_combinations(candidates, target - n, combinations, combination, i+1)
    
    combination.pop
  end

  combinations
end

# p combination_sum2([1,2,1,5], 8)
p combination_sum2([10,1,2,7,6,1,5, 1], 8)
p combination_sum2([2,5,2,1,2], 5)