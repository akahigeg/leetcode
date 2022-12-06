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
    # => 再帰が進めばいずれ追加されていくので、スキップしても大丈夫ということ
    # => 現在のループにおいて同じ数字を使うと、同じ組み合わせが追加されてしまうので
    # 例: [1,2,2,2,2,7], 7 => 
    #    combinationが[1,2]の回でそのままループすると 3番目の2と4番目の2と5番目の2がともに追加されてしまい、重複が発生する
    #    なので4番目と5番目はスキップする
    #    3番目の2を処理した先にあるcombinationが[1,2,2]の回のループでは4番目の2と5番目の2も処理されるため、4番目の2と5番目の2がどこかに行ってしまうということはない（5番目の2は結果的に追加されないが）
    # => candidatesに同じ数字が含まれている場合だけ重複が発生するので、これを回避するための絞り込みの方法
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
p combination_sum2([2,5,2,1,2,2,7], 7)